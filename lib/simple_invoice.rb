module SimpleInvoice
  autoload :VERSION, 'simple_invoice/version'
  autoload :Invoice, 'simple_invoice/invoice'
  autoload :InvoiceData, 'simple_invoice/invoice_data'
  autoload :LineItems, 'simple_invoice/line_items'
  autoload :LineItem, 'simple_invoice/line_item'
  autoload :InvoiceTemplate, 'simple_invoice/invoice_template'
  autoload :Subscription, 'simple_invoice/subscription'
  autoload :Contact, 'simple_invoice/contact'
  autoload :Services, 'simple_invoice/services'
  autoload :Config, 'simple_invoice/config'
  autoload :BillingPeriodType, 'simple_invoice/billing_period_type'
  autoload :BillingPeriod, 'simple_invoice/billing_period'
end
