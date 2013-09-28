module SimpleInvoice
  class BillingPeriodType

    def self.weekly
      Weekly.new 1
    end

    def self.fortnightly
      Weekly.new 2
    end

    def self.monthly
      Monthly.new 1
    end

    def self.quarterly
      Monthly.new 3
    end

    def self.annually
      Monthly.new 12
    end

    autoload :Monthly, 'simple_invoice/billing_period_type/monthly'
    autoload :Weekly, 'simple_invoice/billing_period_type/weekly'

    # @param multiple [Fixnum]
    def initialize multiple=1
      @multiple = multiple
    end

    # @param first_day [Date]
    def first_day_of_next_period first_day
      raise "to be implemented in subclass"
    end

    # @param first_day [Date]
    # @return [Date]
    def last_day_of_period first_day
      first_day_of_next_period(first_day).prev_day
    end

  end
end
