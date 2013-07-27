module Spree
  class SpreeSellerUsers < ActiveRecord::Base
    attr_accessible :seller_id, :user_id
    belongs_to :seller
    belongs_to :user
  end
end
