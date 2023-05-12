class AddStarToParkComments < ActiveRecord::Migration[6.1]
  def change
    add_column :park_comments, :star, :string
  end
end
