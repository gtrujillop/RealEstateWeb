class Zone < ActiveRecord::Base
	validates :name, presence: true

end
