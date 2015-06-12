FactoryGirl.define do

  factory :property_element do
    name 'Habitación Principal'
    description 'Habitación de 9m2 con baño interno'
    image File.new(Rails.root + 'public/bedroom_1.jpeg')
    is_active true
    association :property, factory: :property
    association :element_type, factory: :element_type
  end

end
