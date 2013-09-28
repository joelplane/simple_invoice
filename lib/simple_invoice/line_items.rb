module SimpleInvoice
  class LineItems

    def initialize
      @line_items = []
    end

    # @param line_item [LineItem]
    def push line_item
      @line_items.push line_item
    end

    # @return [Fixnum]
    def total
      sum @line_items.collect(&:total)
    end

    private

    # @param values [Array<Fixnum>]
    # @return [Finxum]
    def sum values
      values.inject(0){|a,b| a + b }
    end

  end
end
