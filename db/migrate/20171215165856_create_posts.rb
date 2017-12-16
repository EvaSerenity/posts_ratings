class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :user_ip, null: false
      t.belongs_to :user, foreign_key: true

      t.decimal :avg_rating, precision: 3, scale: 2
      t.integer :ratings_count, default: 0

      t.timestamps
    end
  end
end
