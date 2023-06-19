class AddLongitudeToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :longitude, :float
  end
end
