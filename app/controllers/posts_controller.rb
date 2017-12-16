class PostsController < ApplicationController

  def create

  end

  def best
    @posts = Post.all
    render json: @posts
  end

end