class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  belongs_to :commentable, polymorphic: true

  validates_presence_of :message, :flagged
end
