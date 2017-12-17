class RatingsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    new_average_rating = (post.avg_rating * post.ratings_count + params[:value].to_i) / (post.ratings_count + 1)
    rating_use_case = UseCases::CreateRating.new(params[:post_id], params[:value]).perform
    if rating_use_case.success?
      render json: { average_rating: new_average_rating }
    else
      render status: 422, json: rating_use_case.rating.errors.messages
    end
  end

end