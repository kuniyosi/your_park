class AddCustomerIdToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :customer_id, :integer
  end
end
