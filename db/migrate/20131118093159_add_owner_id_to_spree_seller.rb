class AddOwnerIdToSpreeSeller < ActiveRecord::Migration
  def change
    add_column :spree_sellers, :owner_id, :integer
  end
end
