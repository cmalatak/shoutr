class TextShout < ApplicationRecord
  validates :body, presence: true, length: { in: 1..100 } # Todo update later to like 288 or something
end
