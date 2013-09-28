module SimpleInvoice
  module Services
    class AllocateInvoiceNumber

      # Allocate invoice number and apply it to invoice object
      # @param invoice [SimpleInvoice::Invoice]
      # @return [String] invoice number
      def self.call invoice
        next_invoice_number(invoice).tap do |number|
          invoice.invoice_number = number
        end
      end

      private

      def self.next_invoice_number invoice
        next_invoice_number_callable.call invoice
      end

      def self.next_invoice_number_callable
        SimpleInvoice::Config[:allocate_invoice_number] || lambda do |invoice|
          # This lambda is just a stub implementation
          # A real implementation would be provided by the application,
          # and not this library.
          @next_invoice_number ||= 0
          number = @next_invoice_number += 1
          "INV-#{number}"
        end
      end

    end
  end
end
