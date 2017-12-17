class RatingsController < ApplicationController

  def create
    if params[:value].nil? || !Post.exists?(params[:post_id])
      render status: 422, json: { errors: 'invalid parameters'}
    else
      rating_use_case = UseCases::CreateRating.new(params[:post_id], params[:value])
      new_rating = rating_use_case.calculate_new_rating
      rating_use_case.perform
      render json: { average_rating: new_rating }
    end
  end

end