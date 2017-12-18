class AddIndexOnAvgRatingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_index(:posts, :avg_rating)
  end
end
