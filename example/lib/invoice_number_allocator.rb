module ExampleApplication
  class InvoiceNumberAllocator

    # In a real application, this might do a database query to determine the next
    # unused invoice number. The application may or may not make use of the
    # invoice object passed in (eg. the invoice number might simply be sequence,
    # or it might be based on the issue date - invoice.issue_date() )
    def self.call invoice
      # allocate the same number every time - obviously not an appropriate
      # real-world implementation :)
      123
    end

  end
end
