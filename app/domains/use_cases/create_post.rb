class UseCases::CreatePost

  attr_accessor :post

  delegate :errors, to: :post

  def initialize(title, content, user, ip)
    @title = title
    @content = content
    @user = user
    @ip = ip
    @success = false
  end

  def success?
    @success
  end

  def perform
    @post = Post.create(title: @title, content: @content, user_ip: @ip, user_id: @user.id)
    if @post.persisted?
      success!
    end
    self
  end

  protected

  def success!
    @success = true
  end

end