FactoryGirl.define do

  factory :property do
    area 100
    building_name "Castellón de la Palma"
    floor 1
    floors_number 12
    short_description nil
    for_sell false
    value 2000000.0
    is_active true
    association :lease_holder, factory: :lease_holder
  end

end
