class AddUserToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :user, :string
    add_reference :orders,foreign_key: true
  end
end
