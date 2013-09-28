module SimpleInvoice
  class InvoiceTemplate

    extend Forwardable

    attr_reader :line_items
    attr_reader :data
    def_delegator :@line_items, :push, :add_line_item
    def_delegators :@data, :issue_date, :due_date, :set_dates, :due_days

    def initialize
      @line_items = LineItems.new
      @data = InvoiceData.new
    end

  end
end
