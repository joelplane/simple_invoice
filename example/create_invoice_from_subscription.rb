# bundle exec ruby main.rb

require 'simple_invoice'
require_relative 'lib/invoice_plain_text_formatter'
require_relative 'lib/invoice_number_allocator'

SimpleInvoice::Config.allocate_invoice_number ExampleApplication::InvoiceNumberAllocator

invoice_template = SimpleInvoice::Services::CreateInvoiceTemplate.call do |temp|
  temp.add_item "Monthly lawn mowing", 60_00
end

subscription = SimpleInvoice::Subscription.new.tap do |sub|
  sub.contact = SimpleInvoice::Contact.new("John Smith", "12345678", "john.smith@example.com")
  sub.invoice_template = invoice_template
  sub.due_days = 7
end

issue_date = '2013-10-01'
invoice = SimpleInvoice::Services::CreateInvoiceForSubscription.new(subscription, issue_date).create_invoice

puts ExampleApplication::InvoicePlainTextFormatter.new(invoice)
