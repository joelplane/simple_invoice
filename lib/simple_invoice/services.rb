module SimpleInvoice
  module Services
    autoload :CreateInvoiceForSubscription, 'simple_invoice/services/create_invoice_for_subscription'
    autoload :CreateInvoice, 'simple_invoice/services/create_invoice'
    autoload :CreateInvoiceTemplate, 'simple_invoice/services/create_invoice_template'
    autoload :AllocateInvoiceNumber, 'simple_invoice/services/allocate_invoice_number'
    autoload :ProcessSubscription, 'simple_invoice/services/process_subscription'
    autoload :ProcessSubscriptions, 'simple_invoice/services/process_subscriptions'
  end
end
