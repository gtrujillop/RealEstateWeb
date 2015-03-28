class Property < ActiveRecord::Base
	Cities.data_path = Rails.root.join('config', 'extras', 'cities')

	attr_accessor :city
	validates :area, presence: true, 
							numericality: true
	validates :floors_number, presence: true, 
							numericality: { only_integer: true }
	validates :address, presence: true
	validates :is_active, presence: true

	belongs_to :lease_holder
	belongs_to :neighbor

	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude

	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
