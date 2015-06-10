class Property < ActiveRecord::Base
  Cities.data_path = Rails.root.join('config', 'extras', 'cities')

  attr_accessor :city
  attr_accessor :location
  attr_accessor :neighbor
  attr_accessor :value
  attr_accessor :operation_type

  validates :area, presence: true,
              numericality: true

  validates :floors_number, presence: true,
              numericality: { only_integer: true }

  # validates :value_for_sell, numericality: true
  # validates :value_for_rental, numericality: true

  before_validation(on: :create) do
    self.address = full_address
  end

  after_validation :set_value

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  belongs_to :lease_holder

  geocoded_by :address

  reverse_geocoded_by :latitude, :longitude

  after_save :set_is_active

  def set_is_active
    self.update_column(:is_active, true)
  end
  private :set_is_active

  def full_address
    location << ", #{city_and_country}" unless location.nil?
  end
  private :full_address

  def city_and_country
    city << ", Colombia" unless city.nil?
  end
  private :city_and_country

  def set_value
    if operation_type == true
      self.value_for_sell = value
    else
      self.value_for_rental = value
    end
  end
  private :set_value
end
