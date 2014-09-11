require 'rails_helper'

describe Pin do
  describe '#coordinates' do
    it 'turn a pins address into coordinates through json google API request' do
      new_pin = Pin.create(address: "3813 NE Cleveland Ave.")
      expect(new_pin.lat).to eq(45.5503637)
    end
  end
end
