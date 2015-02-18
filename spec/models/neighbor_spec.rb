require 'rails_helper'

describe Neighbor do

  describe "presence validations" do

		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:stratus) }

	end

	describe "number validations" do
		it { should validate_numericality_of(:stratus) }
		
	end

	describe 'length validations' do
		it { should validate_length_of(:name).is_at_most(140) }
	end


end
