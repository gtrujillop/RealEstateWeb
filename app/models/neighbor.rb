class Neighbor < ActiveRecord::Base

	validates :name, presence: true, length: { maximum: 140 }
	validates :stratus, presence: true, numericality: { only_integer: true }

	belongs_to :zone

end
