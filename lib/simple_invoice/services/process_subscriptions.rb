module SimpleInvoice
  module Services
    class ProcessSubscriptions

      # @param date [Date, String]
      # @param subscriptions [Array<SimpleInvoice::Subscription>]
      # @return [Array<SimpleInvoice::Invoice>]
      def self.call date, subscriptions
        subscriptions.collect do |sub|
          ProcessSubscription.call date, sub
        end.compact
      end

    end
  end
end
