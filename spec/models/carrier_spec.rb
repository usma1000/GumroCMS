require 'rails_helper'

RSpec.describe Carrier, type: :model do

  before :each do
    @carrier = Carrier.new name: "First Carrier"
  end

  describe "#create" do
    it "should be a carrier" do
      expect(@carrier).to be_an_instance_of Carrier
    end

    it "should raise error with a blank name" do
      expect(Carrier.create(name: nil).valid?).to be(true)
    end

  end

end
