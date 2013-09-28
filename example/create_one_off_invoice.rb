# bundle exec ruby create_one_off_invoice.rb

require 'simple_invoice'
require_relative 'lib/invoice_plain_text_formatter'
require_relative 'lib/invoice_number_allocator'

SimpleInvoice::Config.allocate_invoice_number ExampleApplication::InvoiceNumberAllocator

# Invoices should be created using CreateInvoice or CreateInvoiceForSubscription
# which both wrap SimpleInvoice::Invoice.new

invoice = SimpleInvoice::Services::CreateInvoice.call do |inv|
  inv.contact = SimpleInvoice::Contact.new("John Smith", "12345678", "john.smith@example.com")
  inv.set_dates '2013-10-01', 7
  inv.add_item "Brown paper bag", 15
  inv.add_item "Pliers", 995, 2
end

puts ExampleApplication::InvoicePlainTextFormatter.new(invoice)
