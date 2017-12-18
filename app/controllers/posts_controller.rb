class PostsController < ApplicationController

  def create
    user_use_case = UseCases::CreateUser.new(params[:login]).perform
    if user_use_case.success?
      post_use_case = UseCases::CreatePost
          .new(params[:title], params[:content], user_use_case.user, params[:user_ip])
          .perform
      if post_use_case.success?
        render json: post_use_case.post
      else
        render status: 422, json: post_use_case.post.errors
      end
    else
      render status: 422, json: user_use_case.user.errors
    end
  end

  def best
    posts = BestPostsQuery.new(params[:count]).best_posts
    render json: posts.pluck(:title, :content)
  end

end