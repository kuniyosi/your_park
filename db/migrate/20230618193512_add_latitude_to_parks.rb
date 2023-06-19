class AddLatitudeToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :latitude, :float
  end
end
