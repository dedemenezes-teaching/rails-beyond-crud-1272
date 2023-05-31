class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other #=> PASS THE INSTANCE OF RESTAURANT
  end

  private

  def review_params
    # => {"authenticity_token"=>"[FILTERED]", "review"=>{"content"=>"Very nice restaurant"}, "commit"=>"Create Review", "restaurant_id"=>"12"}
    #=> "review"=>{"content"=>"Very nice restaurant"}
    params.require(:review).permit(:content)
  end
end
