class FixActiveSpreeSellerColumb < ActiveRecord::Migration
  def change
  	rename_column :spree_sellers, :is_active, :active
  end
end
