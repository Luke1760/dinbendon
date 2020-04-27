class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :quantity
      t.string :integer
      t.string :price
      t.string :integer
      t.string :item
      t.string :belongs_to

      t.timestamps
    end
  end
end
