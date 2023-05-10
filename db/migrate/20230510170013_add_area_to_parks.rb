class AddAreaToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :area, :string
  end
end
