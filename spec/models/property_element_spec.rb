require 'rails_helper'

describe PropertyElement do

  describe "presence validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe "relation with user model" do
    it { should belong_to(:property) }
  end

  describe "relation with element_type model" do
    it { should belong_to(:element_type) }
  end

  describe 'callbacks' do

    it 'sets is_active as true' do
      image =  File.new(Rails.root + 'public/system/property_elements/images/000/000/009/original/bedroom_1.jpeg')
      element = PropertyElement.new({ name: 'Alcoba', description: 'Alcoba principal', image: image})
      element.save
      expect(PropertyElement.last.is_active).to be_truthy
    end
  end
end
