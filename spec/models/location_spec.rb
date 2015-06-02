require 'rails_helper'

describe Location do

  describe "format validations" do

   #it { should validate_length_of(:description).is_at_most(500) }
  end

  describe 'callbacks' do
    it 'builds the location address' do
      location = Location.new({city: "Medellín", base_address: "Carrera 78A # 27-100"})
      location.save
      expect(Location.last.address).to eq("Carrera 78A # 27-100, Medellín, Colombia")
    end

    it 'geocodes the location adding latitude and longitude after validation after saving' do
      location = Location.new({ city: "Medellín", base_address: "Bolivariana 66# 34a - 76" })
      location.save
      expect(Location.last.latitude).to_not be_nil
      expect(Location.last.longitude).to_not be_nil
    end

    it 'sets is_active as true' do
      location = Location.new({ city: "Medellín", base_address: "Carrera 78A # 27-100" })
      location.save
      expect(Location.last.is_active).to be_truthy
    end
  end
end
