class Role < ApplicationRecord
  belongs_to :permission
  has_many :users, dependent: :destroy

  validates_presence_of :title, :description
end
