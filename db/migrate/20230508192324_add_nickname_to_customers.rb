class AddNicknameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :nickname, :string,   null: false
  end
end
