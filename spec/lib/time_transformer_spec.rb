require 'spec_helper'
require 'time_transformer'

describe TimeTransformer do
  it "can convert time from string to int" do
    TimeTransformer.str_to_i('2:30 PM').should eql(870)
    TimeTransformer.str_to_i('2:30 AM').should eql(150)
  end
  it "handles noon correctly" do
    TimeTransformer.str_to_i('12:00 PM').should eql(720)
  end
  it "can convert time from int to string" do
    TimeTransformer.i_to_str(870).should eql('2:30 PM')
    TimeTransformer.i_to_str(150).should eql('2:30 AM')
  end
end