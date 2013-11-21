# Spree::Order.class_eval do
#   Spree::Order.state_machine.before_transition :to => :complete, :do => :create_seller_orders!

#   protected
#   def create_seller_orders!
#     sub_orders_hash = self.line_items.group_by{|l| l.variant.seller.id}
#     sub_orders_hash.each do |k, v|
#       seller_order = Spree::SellerOrder.create(:seller_id => k, :line_items => v, :order_id => self.id)
#     end
#   end
# end
