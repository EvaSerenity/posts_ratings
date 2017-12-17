class RatePostWorker
  include Sidekiq::Worker
  def perform(post_id, rating_value)
    Post.transaction do
      rating = Rating.create(value: rating_value.to_i, post_id: post_id)
      post = Post.find(post_id)
      post.update(avg_rating: (post.avg_rating * (post.ratings_count - 1) + rating_value.to_i) / post.ratings_count)
    end
  end
end