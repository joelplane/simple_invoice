module SimpleInvoice
  module Services
    class ProcessSubscription

      # @param date [Date, String]
      # @param subscription [SimpleInvoice::Subscription]
      # @return [nil, SimpleInvoice::Invoice]
      def self.call date, subscription
        new(date, subscription).maybe_invoice
      end

      # @return [nil, SimpleInvoice::Invoice]
      def maybe_invoice
        if should_create_an_invoice_today?
          create_invoice
        else
          nil
        end
      end

      protected

      # @param date [Date, String]
      # @param subscription [SimpleInvoice::Subscription]
      def initialize date, subscription
        @date = to_date date
        @subscription = subscription
      end

      private

      def should_create_an_invoice_today?
        billing_periods = @subscription.billing_periods
        catch(:break_with_return_value) do
          loop do
            billing_period = billing_periods.next
            if billing_period.first_day == @date
              throw :break_with_return_value, true
            elsif billing_period.first_day > @date
              throw :break_with_return_value, false
            end
          end
        end
      end

      def create_invoice
        CreateInvoiceForSubscription.new(@subscription, @date).create_invoice
      end

      # @param [String, Date] date
      # @return [Date]
      def to_date date
        if date.is_a? Date
          date
        else
          Date.parse date.to_s
        end
      end

    end
  end
end
