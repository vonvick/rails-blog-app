class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save :downcase_email

  validates :firstname,
            presence: true,
            length: { minimum: 2 }
  validates :lastname,
            presence: true,
            length: { minimum: 2 }
  validates :username,
            presence: true,
            length: { minimum: 2 }
  validates :password,
             length: { minimum: 8 },
             presence: true, 
             on: :create
  validates :email,
            uniqueness: true,
            presence: true,
            format: { with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i }
  validates :username,
            uniqueness: true

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def is_admin?
    role.find_by(title: 'admin').exists?
  end

  def is_moderator?
    role.find_by(title: 'moderator').exists?
  end

  def is_regular?
    role.find_by(title: 'regular').exists?
  end
end
