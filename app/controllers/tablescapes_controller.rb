class TablescapesController < ApplicationController
  def index
    @tablescapes = Tablescape.all
  end

  def search_results
    @tablescapes = Tablescape.where(tag: params[:query])
  end
end
