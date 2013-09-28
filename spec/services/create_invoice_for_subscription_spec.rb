require 'spec_helper'

module SimpleInvoice
  describe Services::CreateInvoiceForSubscription do

    let(:line_item_1) { LineItem.new "line item 1", 49_95, 1 }
    let(:line_item_2) { LineItem.new "line item 2", 49_95, 2 }
    let(:line_items) { LineItems.new [line_item_1, line_item_2]}
    let(:template) do
      double 'invoice_template', :line_items => line_items
    end
    let(:contact) { double('contact') }
    let(:subscription) do
      double 'subscription', :contact => contact,
                             :invoice_template => template,
                             :due_days => 7
    end
    let(:issue_date) { Date.parse('2013-10-01') }
    subject { Services::CreateInvoiceForSubscription.new(subscription, issue_date) }

    describe "#create_invoice" do
      let(:invoice) { subject.create_invoice }
      it "should produce an invoice" do
        invoice.should be_a Invoice
      end
      it "should set issue date and due date" do
        invoice.issue_date.should == issue_date
        invoice.due_date.should == Date.parse('2013-10-08')
      end
      it "should set contact" do
        invoice.contact.should == contact
      end
      it "should not set an invoice number" do
        invoice.invoice_number.should be_nil
      end
      it "should add line items" do
        invoice.line_items.length.should == 2
      end
      it "should copy line items" do
        invoice.line_items.should_not equal line_items
        line_item = invoice.line_items.to_a.first
        line_item.should == line_item_1 # same value
        line_item.should_not equal line_item_1 # different object
      end
    end

  end
end
