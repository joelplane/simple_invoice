module SimpleInvoice
  module Services
    class CreateInvoice

      # @return [SimpleInvoice::Invoice]
      def self.call &block
        instance = new
        block.call instance
        instance.create_invoice
      end

      attr_writer :contact

      extend Forwardable
      def_delegator :invoice, :set_dates

      # @return [SimpleInvoice::Invoice]
      def create_invoice
        invoice.tap do |inv|
          allocate_invoice_number inv
        end
      end

      # @param description [String]
      # @param price [Fixnum]
      # @param quantity [Fixnum]
      def add_item description, price, quantity=1
        line_item = LineItem.new description, price, quantity
        invoice.add_line_item line_item
      end

      private

      def invoice
        @invoice ||= Invoice.new.tap do |inv|
          inv.contact = contact
        end
      end

      def allocate_invoice_number invoice
        AllocateInvoiceNumber.call invoice
      end

      def contact
        @contact ||= Contact.new
      end

    end
  end
end
