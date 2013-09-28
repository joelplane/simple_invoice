GARDENING_SUBSCRIPTION = begin
  invoice_template = SimpleInvoice::Services::CreateInvoiceTemplate.call do |temp|
    temp.add_item "Monthly gardening", 50_00
  end

  SimpleInvoice::Subscription.new.tap do |sub|
    sub.contact = SimpleInvoice::Contact.new("John Smith", "12345678", "john.smith@example.com")
    sub.invoice_template = invoice_template
    sub.due_days = 7
    sub.billing_period_type = :monthly
    sub.start_date = '2013-01-04'
  end
end
