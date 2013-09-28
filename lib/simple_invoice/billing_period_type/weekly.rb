module SimpleInvoice
  class BillingPeriodType
    class Weekly < BillingPeriodType

      # @param first_day [Date]
      def first_day_of_next_period first_day
        first_day.next_day(7 * @multiple)
      end

    end
  end
end
