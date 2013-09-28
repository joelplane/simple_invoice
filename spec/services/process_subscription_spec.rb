require 'spec_helper'

module SimpleInvoice
  describe Services::ProcessSubscription do

    let(:template) do
      double 'invoice_template', :line_items => LineItems.new([])
    end

    def subscription
      double 'subscription', :contact => nil,
                             :invoice_template => template,
                             :due_days => 7,
                             :start_date => Date.parse('2013-01-02'),
                             :billing_periods => ([
                               '2013-01-02',
                               '2013-02-02',
                               '2013-03-02',
                               '2013-04-02',
                               '2013-05-02',
                               '2013-06-02'
                             ].collect do |date|
                               double('billing_period', :first_day => Date.parse(date))
                             end).each #=> Enumerator
    end

    def call date
      Services::ProcessSubscription.call date, subscription
    end

    specify do
      call('2012-12-02').should be_nil
      call('2013-01-01').should be_nil
      call('2013-01-02').should be_a Invoice
      call('2013-01-03').should be_nil
      call('2013-02-01').should be_nil
      call('2013-02-02').should be_a Invoice
      call('2013-02-03').should be_nil
    end

  end
end
