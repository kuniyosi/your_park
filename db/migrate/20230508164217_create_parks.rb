class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      
      t.integer :customers_id,    null: false
      t.string :name,             null: false
      t.text :introduction,           null: false

      t.timestamps
    end
  end
end
