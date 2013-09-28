require 'spec_helper'

module SimpleInvoice
  describe LineItem do

    subject { LineItem.new "", 29_95, 2 }

    describe "#total" do
      it "sums line items" do
        subject.total.should == 29_95 * 2
      end
    end

  end
end
