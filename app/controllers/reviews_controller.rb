class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = current_user.reviews.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @review.update(:rating => params[:rating])
        format.html { redirect_to users_review_path(@review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { redirect_to users_review_path(@review), alert: 'There was an error while rating this review' }
      end
    end
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params[:review]
  end
end
