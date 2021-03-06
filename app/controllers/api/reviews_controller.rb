class Api::ReviewsController < ApplicationController
  before_action :redirect_unless_logged_in, except: [:index]

  def index
    if params[:bizId]
      @reviews = Review.where('biz_id = ?', params[:bizId])
    else
      @reviews = Review.all
    end
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to "/#/businesses/#{params[:bizId]}"
    else
      render json: @review, status: :unprocessable_entity
    end
  end

  # def update
  #   @review = Review.find(params[:id])
  #
  #   if @review.update(review_params)
  #     render :show
  #   else
  #     render json: @review.errors.full_messages, status: 422
  #   end
  # end
  #
  # def destroy
  #   @review = Review.find(params[:id])
  #
  #   if @review.destroy
  #     render :show
  #   else
  #     render json: @review.errors.full_messages, status: 422
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :reviewer_name,
    :reviewer_img, :biz_id)
  end
end
