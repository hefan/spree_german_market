require 'spec_helper'

describe Spree::Address do

  it "address without street number fails" do
    adr = FactoryGirl.build(:address)
    adr.save.should be_false
  end

  it "address with street number works" do
    adr = FactoryGirl.build(:address)
    adr.street_number = "123"
    adr.save.should be_true
  end

end
