module ExampleApplication
  class InvoiceNumberAllocator

    # In a real application, this might do a database query to determine the next
    # unused invoice number. The application may or may not make use of the
    # invoice object passed in (eg. the invoice number might simply be sequence,
    # or it might be based on the issue date - invoice.issue_date() )
    def self.call invoice
      # A very bad way to allocate an invoice number,
      # but it's just a silly example:
      Time.now.to_i
    end

  end
end
