class Operation < ActiveRecord::Base

	validates :start_date, presence: true
  validates :end_date, presence: true
  validates :payment, presence: true, numericality: true

  after_save :set_is_active
  after_save :set_duration

	belongs_to :property

	def set_is_active
		self.update_column(:is_active, true)
	end
	private :set_is_active

end
