module SimpleInvoice
  class LineItem < Struct.new(:description, :price, :quantity)

    # @return [Fixnum]
    def total
      price * quantity
    end

  end
end
