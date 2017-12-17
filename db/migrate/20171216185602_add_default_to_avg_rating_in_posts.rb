class AddDefaultToAvgRatingInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :avg_rating, 0
  end
end
