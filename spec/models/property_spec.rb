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

	describe "relation with neighbor model" do
		it { should belong_to(:neighbor) }
	end

	describe 'after_validations' do
		it 'builds the property address' do
			property = Property.new({ area: 65, building_name: 'Castellón de la Palma', 
				neighbor_id: 1, floor: 307, floors_number: 12, lease_holder_id: 10,
				is_active: true, city: "Medellín", location: "Carrera 78A # 27-100"})
			property.save
			expect(Property.last.address).to eq("Carrera 78A # 27-100, Medellín, Colombia")
		end

		it 'sets is_active as true' do
			property = Property.new({ area: 65, building_name: 'Castellón de la Palma', 
				neighbor_id: 1, floor: 307, floors_number: 12, lease_holder_id: 10,
				city: "Medellín", location: "Carrera 78A # 27-100"})
			property.save
			expect(Property.last.is_active).to be_truthy
		end
	end
	

end
