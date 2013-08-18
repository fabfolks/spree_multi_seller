class AddOrderIdToSpreeSellerOrder < ActiveRecord::Migration
  def change
    add_column :spree_seller_orders, :order_id, :integer
  end
end
