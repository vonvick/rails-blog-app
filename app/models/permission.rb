class Permission < ApplicationRecord
  has_many :roles, dependent: :destroy

  validates_presence_of :title, :description
end
