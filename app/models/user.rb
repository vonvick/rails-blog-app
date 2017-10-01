class User < ApplicationRecord
  belongs_to :role
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :firstname, :lastname, :username, :email, :password
end
