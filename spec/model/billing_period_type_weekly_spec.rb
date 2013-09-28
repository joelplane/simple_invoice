require 'spec_helper'

module SimpleInvoice
  describe BillingPeriodType::Weekly do

    context "weekly" do
      subject { BillingPeriodType::Weekly.new 1 }

      describe "#last_day_of_period" do
        specify do
          {
            '2012-02-27' => '2012-03-04',
            '2013-02-27' => '2013-03-05',
            '2013-09-01' => '2013-09-07',
            '2013-10-27' => '2013-11-02',
            '2013-12-27' => '2014-01-02'
          }.each do |first_day, last_day|
            subject.last_day_of_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end

      describe "#first_day_of_next_period" do
        specify do
          {
            '2012-02-27' => '2012-03-05',
            '2013-02-27' => '2013-03-06',
            '2013-09-01' => '2013-09-08',
            '2013-10-27' => '2013-11-03',
            '2013-12-27' => '2014-01-03'
          }.each do |first_day, last_day|
            subject.first_day_of_next_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end
    end

    context "fortnightly" do
      subject { BillingPeriodType::Weekly.new 2 }

      describe "#last_day_of_period" do
        specify do
          {
            '2012-02-27' => '2012-03-11',
            '2013-02-27' => '2013-03-12',
            '2013-09-01' => '2013-09-14',
            '2013-10-27' => '2013-11-09',
            '2013-12-27' => '2014-01-09'
          }.each do |first_day, last_day|
            subject.last_day_of_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end

      describe "#first_day_of_next_period" do
        specify do
          {
            '2012-02-27' => '2012-03-12',
            '2013-02-27' => '2013-03-13',
            '2013-09-01' => '2013-09-15',
            '2013-10-27' => '2013-11-10',
            '2013-12-27' => '2014-01-10'
          }.each do |first_day, last_day|
            subject.first_day_of_next_period(Date.parse(first_day)).should == Date.parse(last_day)
          end
        end
      end
    end

  end
end
