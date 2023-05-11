class CreateParkTags < ActiveRecord::Migration[6.1]
  def change
    create_table :park_tags do |t|
      t.references :park, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
