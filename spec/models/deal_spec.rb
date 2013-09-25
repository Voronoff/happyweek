require 'spec_helper'


describe Deal do
  describe 'when converting time formats' do
    it 'can convert time from string to int' do
      Deal.time_str_to_i('14:30').should eql(870)
    end
    it 'can convert time from int to string' do
      Deal.time_i_to_str(870).should eql('14:30')
    end
  end
  describe 'finding deals at time' do
    fixtures :deals
    it 'x' do
      expect(Deal.deals_at_time('12:00')).to have(2).records
    end
  end
end
