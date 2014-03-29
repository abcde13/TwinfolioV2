class AddEPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :epassword, :string
  end
end
