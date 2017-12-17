class UseCases::CreateRating

  attr_accessor :rating

  delegate :errors, to: :rating

  def initialize(post_id, value)
    @post_id = post_id
    @value = value
    @success = false
  end

  def success?
    @success
  end

  def perform
    save_rating
    update_post_average_rating
    if @rating.persisted?
      success!
    end
    self
  end

  protected

  def success!
    @success = true
  end

  private

  def save_rating
    @rating = Rating.create(value: value.to_i, post_id: post_id)
  end

  def update_post_average_rating
    post = Post.find(@post_id)
    post.update(avg_rating: (post.avg_rating * (post.ratings_count - 1) + @value.to_i) / post.ratings_count)
  end

end