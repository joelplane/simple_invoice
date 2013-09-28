require 'spec_helper'

module SimpleInvoice
  describe Subscription do

    subject do
      Subscription.new.tap do |sub|
        sub.start_date = Date.parse('2013-01-02')
        sub.billing_period_type = :monthly
      end
    end

    describe "#billing_periods" do
      specify do
        billing_periods = subject.billing_periods
        [
          '2013-01-02',
          '2013-02-02',
          '2013-03-02',
          '2013-04-02'
        ].each do |date|
          billing_periods.next.first_day.should == Date.parse(date)
        end
      end
    end

  end
end
