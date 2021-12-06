class ReviewsController < ApplicationController

def index
  @review = Review.all
end

  def new
    @review = Review.new
    @list = List.find(params[:list_id])
  end

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to list_path(@review.list)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
