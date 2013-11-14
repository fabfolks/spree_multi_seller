class AddMessageToSpreeSellers < ActiveRecord::Migration
  def change
    add_column :spree_sellers, :themessage, :string
  end
end
