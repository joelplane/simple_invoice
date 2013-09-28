module SimpleInvoice
  module Services
    class CreateInvoiceTemplate

      # @return [SimpleInvoice::InvoiceTemplate]
      def self.call &block
        instance = new
        block.call instance
        instance.create_invoice_template
      end

      # @return [SimpleInvoice::InvoiceTemplate]
      def create_invoice_template
        invoice_template
      end

      # @param description [String]
      # @param price [Fixnum]
      # @param quantity [Fixnum]
      def add_item description, price, quantity=1
        line_item = LineItem.new description, price, quantity
        invoice_template.add_line_item line_item
      end

      private

      def invoice_template
        @invoice_template ||= InvoiceTemplate.new
      end

    end
  end
end
