module SimpleInvoice
  module Services
    autoload :CreateInvoiceForSubscription, 'simple_invoice/services/create_invoice_for_subscription'
    autoload :CreateInvoice, 'simple_invoice/services/create_invoice'
    autoload :AllocateInvoiceNumber, 'simple_invoice/services/allocate_invoice_number'
  end
end
