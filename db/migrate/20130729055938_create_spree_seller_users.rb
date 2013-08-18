class CreateSpreeSellerUsers < ActiveRecord::Migration
  def change
    create_table :spree_seller_users do |t|
      t.integer :seller_id
      t.integer :user_id

      t.timestamps
    end
  end
end
