module SimpleInvoice
  class Invoice

    extend Forwardable

    attr_accessor :contact, :void
    attr_reader :line_items
    def_delegator :@line_items, :push, :add_line_item
    def_delegators :@data, :invoice_number, :invoice_number=, :issue_date,
                           :due_date, :set_dates, :due_days

    # @param inv_number [#to_s, nil]
    # @param issue_date [#to_s, Date, nil]
    # @param due_date_or_due_days [#to_s, Date, Fixnum, nil] interpreted as due days if Fixnum
    def initialize invoice_number=nil, issue_date=nil, due_date_or_due_days=nil
      @line_items = LineItems.new
      @data = InvoiceData.new invoice_number=nil, issue_date=nil, due_date_or_due_days=nil
      @void = false
    end

  end
end
