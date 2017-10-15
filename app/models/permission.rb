class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates_presence_of :title, :description
end
