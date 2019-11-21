class TablescapesController < ApplicationController
  before_action :set_tablescape, only: [:show]

  def index
    @tablescapes = Tablescape.geocoded

    @markers = @tablescapes.map do |tablescape|
      {
        lat: tablescape.latitude,
        lng: tablescape.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @items = Item.where(tablescape: params[:id])
  end

  def search_results
    if params[:query].present?
      @tablescapes = Tablescape.search_by_tag(params[:query])
    else
      @tablescapes = Tablescape.geocoded
    end
  end

  def new
    @tablescape = Tablescape.new
  end

  def create
    @tablescape = Tablescape.new(tablescape_params)
    if @tablescape.save
      redirect_to tablescape_path(@tablescape)
    else
      render :new
    end
  end

#   def edit
#   end

#   def update
#     @tablescape.update(tablescape_params)
#     redirect_to tablescape_path(@tablescape)
#   end

#   def destroy
#     @tablescape.destroy
#     redirect_to tablescapes_path
#   end

  private

  def tablescape_params
    params.require(:tablescape).permit(:name, :price_per_person, :description, :tag, :location, photo: [])
  end

  def set_tablescape
    @tablescape = Tablescape.find(params[:id])
  end
end
