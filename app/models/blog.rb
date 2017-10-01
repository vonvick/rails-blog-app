class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commentable

  validates_presence_of :title, :content, :published
end
