class AddCoordinatesToTablescapes < ActiveRecord::Migration[5.2]
  def change
    add_column :tablescapes, :latitude, :float
    add_column :tablescapes, :longitude, :float
  end
end
