# bundle exec ruby run_daily_process_subscriptions.rb

require 'simple_invoice'
require_relative 'lib/invoice_plain_text_formatter'
require_relative 'lib/invoice_number_allocator'
require_relative 'lib/example_subscriptions/lawn_mowing_subscription'
require_relative 'lib/example_subscriptions/gardening_subscription'

SimpleInvoice::Config.allocate_invoice_number ExampleApplication::InvoiceNumberAllocator

# In a real application, this might be the result of Date.today or ARGV[0]
today = '2013-01-02'

# Hard-coded subscription objects. In a real application, subscriptions would
# be reconstructed from database records.
subscriptions = [LAWN_MOWING_SUBSCRIPTION, GARDENING_SUBSCRIPTION]

invoices = SimpleInvoice::Services::ProcessSubscriptions.call today, subscriptions

# In a real application, invoices would need to be persisted at this point, and
# perhaps further processed, like generating a PDF and sending it in an email.

puts "Processed #{subscriptions.length} subscriptions and generated #{invoices.length} invoices"
puts ""
invoices.each do |invoice|
  puts ExampleApplication::InvoicePlainTextFormatter.new(invoice)
end
