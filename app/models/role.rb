class Role < ApplicationRecord
  belongs_to :permission
  has_many :users, dependent: :destroy
end
