module SimpleInvoice
  class InvoiceData

    attr_reader :invoice_number, :issue_date, :due_date

    # @param inv_number [#to_s, nil]
    # @param issue_date [#to_s, Date, nil]
    # @param due_date_or_due_days [#to_s, Date, Fixnum, nil] interpreted as due days if Fixnum
    def initialize inv_number=nil, issue_date=nil, due_date_or_due_days=nil
      self.invoice_number = inv_number unless inv_number.nil?
      set_dates(issue_date, due_date_or_due_days) unless [issue_date, due_date_or_due_days].any?(&:nil?)
    end

    # @param inv_number [#to_s]
    def invoice_number= inv_number
      @invoice_number = inv_number.to_s
    end

    # @param issue_date [#to_s, Date]
    # @param due_date_or_due_days [#to_s, Date, Fixnum] interpreted as due days if Fixnum
    def set_dates issue_date, due_date_or_due_days
      @issue_date = to_date issue_date
      if due_date_or_due_days.is_a? Fixnum
        @due_date = @issue_date + due_date_or_due_days
      else
        @due_date = to_date due_date_or_due_days
      end
    end

    # @return [Fixnum]
    def due_days
      (due_date - issue_date).to_i
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
