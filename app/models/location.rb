class Location < ActiveRecord::Base
	Cities.data_path = Rails.root.join('config', 'extras', 'cities')

	attr_accessor :city
  attr_accessor :base_address

  validates :description, length: { maximum: 500 }

  after_save :set_is_active

	geocoded_by :address

	reverse_geocoded_by :latitude, :longitude

  before_validation(on: :create) do
    self.address = full_address
  end

	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	def set_is_active
		self.update_column(:is_active, true)
	end
	private :set_is_active

	def full_address
		base_address << ", #{city_and_country}" unless base_address.nil?
	end
	private :full_address

	def city_and_country
		city << ", Colombia" unless city.nil?
	end
	private :city_and_country
end
