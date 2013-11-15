class AddColumnToSpreeStockLocation < ActiveRecord::Migration
  def change
    add_column :spree_stock_locations, :seller_id, :integer
  end
end
