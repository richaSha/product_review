class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end
end
