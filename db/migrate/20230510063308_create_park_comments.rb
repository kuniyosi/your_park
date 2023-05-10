class CreateParkComments < ActiveRecord::Migration[6.1]
  def change
    create_table :park_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :park_id

      t.timestamps
    end
  end
end
