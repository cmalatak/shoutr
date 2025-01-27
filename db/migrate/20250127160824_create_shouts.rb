class CreateShouts < ActiveRecord::Migration[8.0]
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
