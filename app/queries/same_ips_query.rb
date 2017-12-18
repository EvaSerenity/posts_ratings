class SameIpsQuery
  def initialize(posts = Post.all)
    @posts = posts
  end

  def same_ips
    @posts.group(:user_ip).having("COUNT(DISTINCT user_id) > 1")
  end
end