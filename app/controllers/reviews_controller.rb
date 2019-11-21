class ReviewsController < ApplicationController
  # def show
  #   @booking = Booking.find(params[:booking_id])
  #   @reviews = Review.where(booking_id: @booking)
  # end

  def create
    @review = Review.new
  end

  def update
  end

  def destroy
  end
end
