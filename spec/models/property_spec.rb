require 'rails_helper'

describe Property do
  
  describe "presence validations" do

		it { should validate_presence_of(:area) }
		it { should validate_presence_of(:floors_number) }
		it { should validate_presence_of(:address) }
  	it { should validate_presence_of(:is_active) }

	
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
	

end
