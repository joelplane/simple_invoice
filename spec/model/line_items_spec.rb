require 'spec_helper'

module SimpleInvoice
  describe LineItems do

    describe "#total" do
      it "sums line items" do
        subject.push double("line item 1", :total => 49_95)
        subject.push double("line item 2", :total => 59_90)
        subject.total.should == 49_95 + 59_90
      end
    end

  end
end
