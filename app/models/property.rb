class Property < ActiveRecord::Base
  Cities.data_path = Rails.root.join('config', 'extras', 'cities')

  attr_accessor :city
  attr_accessor :location
  attr_accessor :neighbor

  validates :area, presence: true,
              numericality: true
  validates :floors_number, presence: true,
              numericality: { only_integer: true }

  before_validation(on: :create) do
    self.address = full_address
  end

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  belongs_to :lease_holder

  geocoded_by :address

  reverse_geocoded_by :latitude, :longitude

  after_save :set_is_active

  def set_is_active
    self.update_column(:is_active, true)
  end
  private :set_is_active

  def set_address
    self.address = full_address
  end
  private :set_address

  def full_address
    location << ", #{city_and_country}" unless location.nil?
  end
  private :full_address

  def city_and_country
    city << ", Colombia" unless city.nil?
  end
  private :city_and_country
end
