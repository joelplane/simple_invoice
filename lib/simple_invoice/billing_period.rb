module SimpleInvoice
  class BillingPeriod

    attr_reader :first_day

    # @param [BillingPeriodType, Symbol] billing_period_type
    # @param [Date, String] first_day
    def initialize billing_period_type, first_day
      if billing_period_type.is_a? Symbol
        @billing_period_type = BillingPeriodType.send(billing_period_type)
      else
        @billing_period_type = billing_period_type
      end
      @first_day = to_date first_day
    end

    def last_day
      @last_day ||= @billing_period_type.last_day_of_period(@first_day)
    end

    # @return [BillingPeriod]
    def next_billing_period
      next_first_day = @billing_period_type.first_day_of_next_period @first_day
      self.class.new @billing_period_type, next_first_day
    end

    private

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
