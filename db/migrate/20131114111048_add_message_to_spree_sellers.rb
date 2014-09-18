class AddMessageToSpreeSellers < ActiveRecord::Migration
  def change
    add_column :spree_sellers, :message, :text
  end
end
