require 'spec_helper'

module SimpleInvoice
  describe InvoiceData do
    subject { InvoiceData.new 'INV-123', '2013-09-01', '2013-09-08' }

    describe "#invoice_number=" do
      it "should store as a string" do
        InvoiceData.new(123).invoice_number.should == '123'
      end
    end

    describe "#set_dates" do
      subject { InvoiceData.new 'INV-123' }
      context "given dates as String" do
        it "should parse date strings to Date" do
          subject.set_dates '2013-09-01', '2013-09-08'
          subject.issue_date.should == Date.parse('2013-09-01')
          subject.due_date.should == Date.parse('2013-09-08')
        end
      end
      context "given dates as Date" do
        it "should accept dates as Date type" do
          subject.set_dates Date.parse('2013-09-01'), Date.parse('2013-09-08')
          subject.issue_date.should == Date.parse('2013-09-01')
          subject.due_date.should == Date.parse('2013-09-08')
        end
      end
      context "given due days instead of due_date" do
        it "should interpret a Fixnum as due days" do
          subject.set_dates '2013-09-01', 7
          subject.issue_date.should == Date.parse('2013-09-01')
          subject.due_date.should == Date.parse('2013-09-08')
        end
      end
    end

    describe "#due_days" do
      it "should be the difference between the due date and issue date" do
        subject.due_days.should be_a Fixnum
        subject.due_days.should == 7
      end
    end
  end
end
