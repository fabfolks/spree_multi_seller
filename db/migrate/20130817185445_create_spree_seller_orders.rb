class CreateSpreeSellerOrders < ActiveRecord::Migration
  def change
    create_table :spree_seller_orders do |t|
      t.integer :seller_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
