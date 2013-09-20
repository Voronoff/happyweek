require 'spec_helper'

describe Deal do
  it "can be instantiated" do
    Deal.new.should be_an_instance_of(Deal)
  end

  it "can be saved successfully" do
    Deal.create.should be_persisted
  end
end