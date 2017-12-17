class UseCases::CreateRating

  attr_accessor :rating

  delegate :errors, to: :rating

  def initialize(post_id, value)
    @post_id = post_id
    @value = value
    @success = false
    @post = Post.find(@post_id)
  end

  def success?
    @success
  end

  def perform
    save_rating
    self
  end

  def calculate_new_rating
    (@post.avg_rating * @post.ratings_count + @value.to_i) / (@post.ratings_count + 1)
  end

  protected

  def success!
    @success = true
  end

  private

  def save_rating
    RatePostWorker.perform_async(@post_id, @value)
  end

end