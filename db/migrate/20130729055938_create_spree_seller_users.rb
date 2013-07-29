class CreateSpreeSellerUsers < ActiveRecord::Migration
  def change
    create_table :spree_seller_users do |t|
      t.int :seller_id
      t.int :user_id

      t.timestamps
    end
  end
end
