class PostsController < ApplicationController

  def create
    user = UseCases::CreateUser.new(params[:login]).perform
    post = UseCases::CreatePost
        .new(params[:title], params[:content], user, params[:ip])
        .perform
    if post.errors.empty?
      render json: post
    else
      render status: 422, json: post.errors.messages
    end
  end

  def best
    @posts = Post.all
    render json: @posts
  end

end