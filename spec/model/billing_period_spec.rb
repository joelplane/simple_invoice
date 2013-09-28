require 'spec_helper'

module SimpleInvoice
  describe BillingPeriod do

    subject { BillingPeriod.new :monthly, '2013-09-28' }

    describe "#first_day" do
      specify do
        subject.first_day.should == Date.parse('2013-09-28')
      end
    end

    describe "#last_day" do
      specify do
        subject.last_day.should == Date.parse('2013-10-27')
      end
    end

    describe "#next_billing_period" do
      specify do
        subject.next_billing_period.first_day.should == Date.parse('2013-10-28')
        subject.next_billing_period.last_day.should == Date.parse('2013-11-27')
      end
    end

  end
end
