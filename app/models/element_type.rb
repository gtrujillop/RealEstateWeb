class ElementType < ActiveRecord::Base
  has_many :property_elements

  validates :name, presence: true
  validates :description, presence: true

  after_save :set_is_active

  def set_is_active
    self.update_column(:is_active, true)
  end
  private :set_is_active
end
