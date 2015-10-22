require 'rails_helper'

describe Role do
  describe "presence validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }

  end

  describe "length validations" do
    it { should validate_length_of(:name).is_at_most(30) }
  end

  describe "relation with user" do
    it { should have_many(:users).through(:user_roles) }
  end

end
