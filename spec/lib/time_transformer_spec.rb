require 'spec_helper'
require 'time_transformer'

describe TimeTransformer do
  it "can convert time from string to int" do
    TimeTransformer.str_to_i('2:30 PM').should eql(870)
    TimeTransformer.str_to_i('2:30 AM').should eql(150)
  end
  it "handles midnight and noon correctly for str to i" do
    TimeTransformer.str_to_i('12:00 AM').should eql(1440)
    TimeTransformer.str_to_i('12:00 PM').should eql(720)
  end
  it "can convert time from int to string" do
    TimeTransformer.i_to_str(870).should eql('2:30 PM')
    TimeTransformer.i_to_str(150).should eql('2:30 AM')
  end
  it "handles midnight and noon correctly for i to str" do
    TimeTransformer.i_to_str(1440).should eql('12:00 AM')
    TimeTransformer.i_to_str(720).should eql('12:00 PM')
  end
end