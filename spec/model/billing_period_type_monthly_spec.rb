require 'spec_helper'

module SimpleInvoice
  describe BillingPeriodType::Monthly do

    context "monthly" do
      subject { BillingPeriodType::Monthly.new 1 }

      describe "#last_day_of_period" do
        specify do
          {
            '2012-02-01' => '2012-02-29',
            '2013-02-01' => '2013-02-28',
            '2013-09-01' => '2013-09-30',
            '2013-10-01' => '2013-10-31',
            '2013-12-01' => '2013-12-31'
          }.each do |first_day, last_day|
            subject.last_day_of_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end

      describe "#first_day_of_next_period" do
        specify do
          {
            '2012-02-01' => '2012-03-01',
            '2013-02-01' => '2013-03-01',
            '2013-09-01' => '2013-10-01',
            '2013-10-01' => '2013-11-01',
            '2013-12-01' => '2014-01-01'
          }.each do |first_day, last_day|
            subject.first_day_of_next_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end
    end

    context "quarterly" do
      subject { BillingPeriodType::Monthly.new 3 }

      describe "#last_day_of_period" do
        specify do
          {
            '2011-12-01' => '2012-02-29',
            '2012-12-01' => '2013-02-28',
            '2012-02-01' => '2012-04-30',
            '2013-02-01' => '2013-04-30',
            '2013-09-01' => '2013-11-30',
            '2013-10-01' => '2013-12-31',
            '2013-12-01' => '2014-02-28',
            '2013-06-18' => '2013-09-17'
          }.each do |first_day, last_day|
            subject.last_day_of_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end

      describe "#first_day_of_next_period" do
        specify do
          {
            '2011-12-01' => '2012-03-01',
            '2012-12-01' => '2013-03-01',
            '2012-02-01' => '2012-05-01',
            '2013-02-01' => '2013-05-01',
            '2013-09-01' => '2013-12-01',
            '2013-10-01' => '2014-01-01',
            '2013-12-01' => '2014-03-01',
            '2013-06-18' => '2013-09-18'
          }.each do |first_day, last_day|
            subject.first_day_of_next_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end
    end

  end
end
