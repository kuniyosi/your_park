class RemoveCustomersIdFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :parks, :customers_id, :string
  end
end
