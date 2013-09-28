module SimpleInvoice
  module Services
    class AllocateInvoiceNumber

      # Allocate invoice number and apply it to invoice object
      # @param invoice [SimpleInvoice::Invoice]
      # @return [String] invoice number
      def self.call invoice
        next_invoice_number.tap do |number|
          invoice.invoice_number = number
        end
      end

      private

      # This is just a stub implementation
      # A real implementation would be provided by the application,
      # and not this library.
      def self.next_invoice_number
        @next_invoice_number ||= 0
        "INV-" + (@next_invoice_number += 1)
      end

    end
  end
end
