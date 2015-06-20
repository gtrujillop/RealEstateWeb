class Property < ActiveRecord::Base
  include Filterable

  has_many :property_elements

  Cities.data_path = Rails.root.join('config', 'extras', 'cities')

  attr_accessor :city
  attr_accessor :location
  attr_accessor :neighbor

  validates :area, presence: true,
              numericality: true

  validates :floors_number, presence: true,
              numericality: { only_integer: true }
  #TODO set numericality validation without break the spec.
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

  #TODO add spec coverage for each scope case.
  default_scope { where(is_active: true) }
  scope :located_in, -> (location) { where("address like ?", "%#{location}%") }
  #Property.area_greater_than(n).area_lesser_than(m) works like between
  scope :area_greater_than, -> (area) { where("area >= ?", "#{area}") }
  scope :area_lesser_than, -> (area) { where("area <= ?", "#{area}") }
  #Property.for_sell.sell_greater_than(n).sell_lesser_than(m)
  scope :for_sell, -> (value) { where("for_sell = ?", "#{value}") }
  #Property.for_rental.rental_greater_than(n).rental_lesser_than(m)
  scope :value_greater_than, -> (value) { where("value >= ?", "#{value}") }
  scope :value_lesser_than, -> (value) { where("value <= ?", "#{value}") }

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
    if for_sell == true
      self.value_for_sell = value
    else
      self.value_for_rental = value
    end
  end
  private :set_value
end
