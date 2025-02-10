class PhotoShout < ApplicationRecord
  ACCEPTED_CONTENT_TYPES = [ "image/jpeg", "image/gif", "image/png", "image/webp" ].freeze


  has_one_attached :image # , styles: { thumb: "200x200" } Need to look into how to do this differently

  validates :image, content_type: ACCEPTED_CONTENT_TYPES # only allows JPEG, GIF, PNG, and WebP images
  validates :image, size: { less_than_or_equal_to: 1.megabytes } # restricts the file size to <= 1MB
end
