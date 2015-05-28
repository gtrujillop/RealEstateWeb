class DateProcessor
  attr_accessor :date

  def initialize(date)
    self.date = date.to_date
  end

  def months_between(future_date)
    if date_in_the_future?(future_date)
      (future_date.year * 12 + future_date.month) - (date.year * 12 + date.month)
    else
      0
    end
  end

  def date_in_the_future?(future_date)
    future_date > date
  end
  private :date_in_the_future?

end
