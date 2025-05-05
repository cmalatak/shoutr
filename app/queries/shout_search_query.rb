class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_shouts_for_text_shouts
    # matching_shouts_for_text_shouts. or(matching_shouts_for_photo_shouts)
  end

  private

  attr_reader :term

  def matching_shouts_for_text_shouts
    Shout.where(content_type: "TextShout", content_id: matching_text_shouts.select(:id))
    # Shout.
    # joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id").
    # where("text_shouts.body LIKE ?", "%#{term}%")
  end

  def matching_shouts_for_photo_shouts
    Shout.where(content_type: "PhotoShout", content_id: matching_photo_shouts.select(:id))
    # Shout.
    # joins("LEFT JOIN photo_shouts ON content_type = 'PhotoShout' AND content_id = photo_shouts.id").
    # where("photo_shouts.image LIKE ?", "%#{term}%")
  end

  def matching_text_shouts
    TextShout.where("body LIKE ?", "%#{term}%")
  end

  def matching_photo_shouts
    PhotoShout.where("image.blob.filename LIKE ?", "%#{term}%")
  end
end
