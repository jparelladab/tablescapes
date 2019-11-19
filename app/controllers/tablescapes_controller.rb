class TablescapesController < ApplicationController
  before_action :set_tablescape, only: [:show, :edit, :update, :destroy]

  def index
    @tablescapes = Tablescape.all
  end

  def show
  end

  def new
    @tablescape = Tablescape.new
  end

  def create
    @tablescape = Tablescape.new(tablescape_params)
    @tablescape.save
    redirect_to tablescape_path(@tablescape)
  end

  def edit
  end

  def update
    @tablescape.update(tablescape_params)
    redirect_to tablescape_path(@tablescape)
  end

  def destroy
    @tablescape.destroy
    redirect_to tablescapes_path
  end

  private

  def tablescape_params
    params.require(:tablescape).permit(:name, :price_per_person, :description, :user_id, :tag, :location)
  end

  def set_tablescape
    @tablescape = Tablescape.find(params[:id])
  end

end
