module Spree
  module Admin
    class SellerOrdersController < Spree::Admin::BaseController
      before_filter :authorize_seller!
      def index
        @orders = Spree::SellerOrder.find_all_by_seller_id(spree_current_user.seller.id)
      end

      private
        def model_class
          Spree::SellerOrder
        end

        def authorize_seller!
          raise CanCan::AccessDenied unless (spree_current_user.has_spree_role?('admin') or spree_current_user.has_spree_role?('seller'))
        end
    end
  end
end
