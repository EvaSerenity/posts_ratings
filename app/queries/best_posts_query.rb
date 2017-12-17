class BestPostsQuery
  def initialize(count, posts = Post.all)
    @posts = posts
    @count = count
  end

  def best_posts
    @posts.order(avg_rating: :desc).first(@count)
  end
end