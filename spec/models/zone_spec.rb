require 'rails_helper'

describe Zone do
  
  it { should validate_presence_of(:name) }
  
  describe "relation with property model" do
		it { should have_many(:neighbor) }
	end

end
