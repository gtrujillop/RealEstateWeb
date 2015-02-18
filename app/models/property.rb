class Property < ActiveRecord::Base

	validates :area, presence: true, 
							numericality: true
	validates :floors_number, presence: true, 
							numericality: { only_integer: true }
	validates :address, presence: true

	belongs_to :user
	belongs_to :neighbor
end
