module SimpleInvoice
  module Services
    class CreateInvoiceForSubscription

      # @param subscription [SimpleInvoice::Subscription]
      # @param issue_date [Date]
      def initialize subscription, issue_date
        @subscription = subscription
        @issue_date = issue_date
      end

      # @return [SimpleInvoice::Invoice]
      def create_invoice
        invoice
      end

      private

      # @return [SimpleInvoice::InvoiceTemplate]
      def template
        @subscription.invoice_template
      end

      # @return [SimpleInvoice::Contact]
      def contact
        @subscription.contact
      end

      # @return [SimpleInvoice::Invoice]
      def invoice
        @invoice ||= Invoice.new.tap do |invoice|
          invoice.contact = contact
          template.line_items.each do |template_line_item|
            invoice.add_line_item template_line_item.dup
          end
          invoice.set_dates invoice_data.issue_date, invoice_data.due_date
        end
      end

      # @param issue_date [Date]
      # @return [SimpleInvoice::InvoiceData]
      def invoice_data
        @invoice_data ||= InvoiceData.new nil, @issue_date, @subscription.due_days
      end

    end
  end
end
