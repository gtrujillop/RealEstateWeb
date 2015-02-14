require 'rails_helper'

describe Property do
  
  describe "presence validations" do

		it { should validate_presence_of(:area) }
		it { should validate_presence_of(:floors_number) }
		it { should validate_presence_of(:address) }
	
	end

	describe "number validations" do
		it { should validate_numericality_of(:area) }
		it { should validate_numericality_of(:floors_number), :only_integer }
	end
	

end
