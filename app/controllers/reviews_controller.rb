class ReviewsController < ApplicationController
  # def show
  #   @booking = Booking.find(params[:booking_id])
  #   @reviews = Review.where(booking_id: @booking)
  # end
  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    @review.save
    redirect_to bookings_path
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to bookings_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
