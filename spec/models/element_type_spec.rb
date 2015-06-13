require 'rails_helper'

describe ElementType do

  describe "presence validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe "relation with user model" do
    it { should have_many(:property_elements) }
  end

  describe 'callbacks' do

    it 'sets is_active as true' do
      type = ElementType.new({ name: 'Habitación', description: 'blah' })
      type.save
      expect(ElementType.last.is_active).to be_truthy
    end
  end
end
