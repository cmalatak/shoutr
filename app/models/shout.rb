class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..100 } # Todo update later to like 288 or something
  validates :user, presence: true
end
