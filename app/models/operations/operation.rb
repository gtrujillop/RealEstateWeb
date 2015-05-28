class Operation < ActiveRecord::Base

	validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
  validates :payment, presence: true, numericality: true

  after_save :set_is_active
  after_save :set_duration

	belongs_to :property

	def set_is_active
		self.update_column(:is_active, true)
	end
	private :set_is_active

  def set_duration
    self.update_column(:duration, duration_from_dates)
  end
  private :set_duration

  def duration_from_dates
    DateProcessor.new(start_date).months_between(end_date).to_s + " months"
  end
  private :duration_from_dates

end
