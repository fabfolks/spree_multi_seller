# module Spree
#   class SellerOrder < ActiveRecord::Base
#     belongs_to :seller
#     belongs_to :order
#     #attr_accessible :line_item_id, :seller_id, :order_id

#     def self.create(params)
#       unless params[:line_items].nil?
#         params[:line_items].each do |line_item|
#           super(:seller_id => params[:seller_id], :order_id => params[:order_id], :line_item_id => line_item.id)
#         end
#       end
#     end
#   end
# end
