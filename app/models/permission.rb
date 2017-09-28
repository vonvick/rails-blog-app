class Permission < ApplicationRecord
  has_many :roles, dependent: :destroy
end
