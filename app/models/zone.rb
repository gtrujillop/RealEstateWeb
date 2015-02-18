class Zone < ActiveRecord::Base
	validates :name, presence: true

	has_many :neighbor
end
