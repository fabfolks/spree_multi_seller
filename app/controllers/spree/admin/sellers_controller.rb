module Spree
  module Admin
    class SellersController < Spree::Admin::ResourceController
      respond_to :html
      
      def index
      end


      def new
      end

      def create
        @seller = Seller.new seller_params
        if @seller.save!
          #redirect_to new_admin_seller_store_address_path(@seller)
          redirect_to new_admin_user_path(:seller_id => @seller.id)
        else
          render "new"
        end
      end

      def edit
      end

      def update
        @seller = Seller.find(params[:id])
        if @seller.update_attributes(seller_params)
          redirect_to admin_sellers_path, :notice => "Seller updated"
        else
          render "edit"
        end
      end

      def destroy
        @seller = Seller.find(seller_params)
        @seller.destroy
        redirect_to admin_sellers_path, :notice => "Seller Successfully deleted"
      end

    private 

      def seller_params
        params.require(:seller).permit!
      end

    end
  

  end
end