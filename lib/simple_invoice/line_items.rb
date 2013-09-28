module SimpleInvoice
  class LineItems

    # @param line_items [Array<LineItem>]
    def initialize line_items=[]
      @line_items = line_items
    end

    # @param line_item [LineItem]
    def push line_item
      @line_items.push line_item
    end

    def length
      @line_items.length
    end

    def each &block
      @line_items.each(&block)
    end

    def to_a
      @line_items
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
