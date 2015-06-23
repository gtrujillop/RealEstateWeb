require 'rails_helper'

describe Property do

  describe "presence validations" do
    it { should validate_presence_of(:area) }
    it { should validate_presence_of(:floors_number) }
  end

  describe "number validations" do
    it { should validate_numericality_of(:area) }
    it { should validate_numericality_of(:floors_number), :only_integer }
  end

  describe "relation with user model" do
    it { should belong_to(:lease_holder) }
  end

  describe 'callbacks' do
    it 'builds the property address' do
      property = Property.new({ area: 65, building_name: 'Castellón de la Palma',
                                floor: 307, floors_number: 12, lease_holder_id: 10,
                                is_active: true, city: "Medellín", location: "Carrera 78A # 27-100"})
      property.save
      expect(Property.last.address).to eq("Carrera 78A # 27-100, Medellín, Colombia")
    end

    it 'geocodes the property adding latitude and longitude after validation after saving' do
      property = Property.new({ area: 65, building_name: 'Castellón de la Palma',
                                floor: 307, floors_number: 12, lease_holder_id: 10,
                                city: "Medellín", location: "Carrera 78A # 27-100"})
      property.save
      expect(Property.last.latitude).to_not be_nil
      expect(Property.last.longitude).to_not be_nil
    end

    it 'sets is_active as true' do
      property = Property.new({ area: 65, building_name: 'Castellón de la Palma',
                                floor: 307, floors_number: 12, lease_holder_id: 10,
                                city: "Medellín", location: "Carrera 78A # 27-100"})
      property.save
      expect(Property.last.is_active).to be_truthy
    end

    it 'sets property value' do
      property = Property.new({ area: 65, building_name: 'Castellón de la Palma',
                                floor: 307, floors_number: 12, lease_holder_id: 10,
                                city: "Medellín", location: "Carrera 78A # 27-100",
                                for_sell: true, value: 500000, value_for_sell: 500000})
      property.save
      expect(Property.last.value_for_sell).to eq(500000.0)
      expect(Property.last.value_for_rental).to be_nil
    end
  end

  describe '.scopes' do
    let!(:property) { create(:property, area: 65, building_name: 'Castellón de la Palma',
                                floor: 307, floors_number: 12, lease_holder_id: 10,
                                city: "Medellín", location: "Carrera 78A # 27-100",
                                for_sell: true, value: 500000, value_for_sell: 500000) }
    it 'returns properties by address' do
      result = Property.located_in('Medellín')
      expect(result.first.building_name).to eq(property.building_name)
      expect(result.first.is_active).to be_truthy
    end

    # it 'returns properties by latitude and longitude' do
    #   result = Property.latitude(6.22957)
    #   expect(result.first.building_name).to eq(property.building_name)
    # end

    it 'returns properties by value' do
      result = Property.value_greater_than(100000)
      expect(result.first.building_name).to eq(property.building_name)
    end

    it 'returns properties by area' do
      result = Property.area_greater_than(10)
      expect(result.first.building_name).to eq(property.building_name)
    end
  end
end
