# bundle exec ruby create_invoice_from_subscription.rb

require 'simple_invoice'
require_relative 'lib/invoice_plain_text_formatter'
require_relative 'lib/invoice_number_allocator'
require_relative 'lib/example_subscriptions/lawn_mowing_subscription'

SimpleInvoice::Config.allocate_invoice_number ExampleApplication::InvoiceNumberAllocator

subscription = LAWN_MOWING_SUBSCRIPTION

issue_date = '2013-10-01'
invoice = SimpleInvoice::Services::CreateInvoiceForSubscription.new(subscription, issue_date).create_invoice

puts ExampleApplication::InvoicePlainTextFormatter.new(invoice)
