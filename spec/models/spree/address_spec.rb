require 'spec_helper'

describe Spree::Address do

  it "address without street number fails" do
#    attrs = attributes_for(:bill_address)
    adr = FactoryGirl.create(:address)
#    adr.should be_nil
  end

  it "address with street number works" do
#    attrs = attributes_for(:bill_address)
#    attrs[street_number] = "23a"
#    adr = FactoryGirl.create(:address)
#    adr.street_number.should eql("23a")
  end

end
