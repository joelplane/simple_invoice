module ExampleApplication
  class InvoicePlainTextFormatter

    def initialize invoice
      @invoice = invoice
    end

    def to_s
      "#{header}\n" \
      "#{line_items}\n" \
      "#{footer}"
    end

    private

    def header
      "To:             #{@invoice.contact.name}\n" \
      "Invoice number: #{@invoice.invoice_number}\n" \
      "Issue Date:     #{@invoice.issue_date}\n" \
      "Due Date:       #{@invoice.due_date}\n"
    end

    def max_description_length
      @max_description_length ||= @invoice.line_items.to_a.collect do |item|
        item.description.length
      end.max
    end

    def line_items
      line_items_header + "\n" +
      @invoice.line_items.to_a.collect do |item|
        line_item item
      end.join("\n") + "\n" + total_line + "\n"
    end

    def line_items_header
      "%-#{max_description_length}s    Price      Qty.   Total" % ['Description'] + "\n" +
      "-" * (max_description_length + 29)
    end

    def line_item item
      "%-#{max_description_length}s    %s    %2s     %s" % [item.description, format_price(item.price), item.quantity, format_price(item.total)]
    end

    def total_line
      "-" * (max_description_length + 29) + "\n" +
      "%-#{max_description_length}s                      %s" % ['Total', format_price(@invoice.line_items.total)]
    end

    def format_price price
      dollars = price / 100
      cents = price % 100
      "$%3d.%02d" % [dollars, cents]
    end

    def footer
      "Due in #{@invoice.due_days} days"
    end

  end
end
