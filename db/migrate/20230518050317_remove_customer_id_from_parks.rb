class RemoveCustomerIdFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_column :parks, :customer_id, :integer
  end
end
