class PropertyElement < ActiveRecord::Base
  belongs_to :property
  belongs_to :element_type

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  after_save :set_is_active

  def set_is_active
    self.update_column(:is_active, true)
  end
  private :set_is_active

end
