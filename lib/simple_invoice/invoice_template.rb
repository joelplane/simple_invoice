module SimpleInvoice
  class InvoiceTemplate

    extend Forwardable

    attr_reader :line_items
    attr_reader :data
    def_delegator :@line_items, :push, :add_line_item

    def initialize
      @line_items = LineItems.new
    end

  end
end
