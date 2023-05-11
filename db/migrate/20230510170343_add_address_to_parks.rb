class AddAddressToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :address, :string
  end
end
