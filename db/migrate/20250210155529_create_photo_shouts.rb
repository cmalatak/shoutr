class CreatePhotoShouts < ActiveRecord::Migration[8.0]
  def change
    create_table :photo_shouts do |t|

      t.timestamps
    end
  end
end
