module SimpleInvoice
  class Subscription

    attr_accessor :contact, :invoice_template, :due_days, :start_date, :billing_period_type, :cancelled

    def cancel!
      @cancelled = true
    end

    def cancelled?
      !!@cancelled
    end

    # @return [Enumerator]
    def billing_periods
      Enumerator.new do |y|
        period = BillingPeriod.new billing_period_type, start_date
        loop do
          y.yield period
          period = period.next_billing_period
        end
      end
    end

  end
end
