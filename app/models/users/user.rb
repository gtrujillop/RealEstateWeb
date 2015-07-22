class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, presence: true, confirmation: true, length: { minimum: 3}
  validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :password_confirmation, presence: true
  validates :birth_date, date: true

  after_save :set_is_active
  # before_validation :set_date

  has_many :user_roles
  has_many :roles, through: :user_roles

  def is_admin?
    self.roles.map(&:name).include?("Administrator")
  end

  # def set_date
  #   self.update_column(:birth_date, formatted_birth_date)
  # end
  # private :set_date
  #
  # def formatted_birth_date
  #   debugger
  #   Date.strptime(self.birth_date, '%m/%d/%Y')
  # end
  # private :formatted_birth_date

  def set_is_active
    self.update_column(:active, true)
  end
  private :set_is_active
end
