module SimpleInvoice
  class BillingPeriodType
    class Monthly < BillingPeriodType

      # @param first_day [Date]
      def first_day_of_next_period first_day
        first_day.next_month(@multiple)
      end

    end
  end
end
