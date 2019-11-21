class BookingsController < ApplicationController
before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @tablescape = Tablescape.find(params[:tablescape_id])
    @items = Item.where(tablescape: params[:tablescape_id])
  end

  def create
    @tablescape = Tablescape.find(params[:tablescape_id])
    @booking = Booking.new(booking_params)
    @booking.tablescape_id = @tablescape.id
    @booking.user_id = current_user.id
    @booking.total_price = (@tablescape.price_per_person * @booking.attendees)
    @booking.save
    redirect_to tablescape_booking_path(@tablescape, @booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :total_price, :attendees)
  end
end
