FactoryGirl.define do

  factory :property do
    area 100
    building_name "Castellón de la Palma"
    floor 1
    floors_number 12
    address "Carrera 78A #28-100, Medellin Colombia"
    short_description nil
    is_active true
    association :lease_holder, factory: :lease_holder
  end

end
