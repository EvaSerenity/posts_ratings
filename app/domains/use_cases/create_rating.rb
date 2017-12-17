class UseCases::CreateRating
  include ActiveModel::Validations

  attr_accessor :post_id, :value

  validates_presence_of :post_id
  validates_presence_of :value

  def initialize(post_id, value)
    @post_id = post_id
    @value = value
  end

  def perform
    if valid?
      save_rating
      update_post_average_rating
    end

    self
  end

  private

  def save_rating
    Rating.create(value: value.to_i, post_id: post_id)
  end

  def update_post_average_rating
    post = Post.find(@post_id)
    post.update(avg_rating: (post.avg_rating * (post.ratings_count - 1) + @value.to_i) / post.ratings_count)
  end

end