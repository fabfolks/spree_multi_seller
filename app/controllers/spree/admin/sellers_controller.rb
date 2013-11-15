module Spree
  module Admin
    class SellersController < Spree::Admin::ResourceController
      respond_to :html
      
      def index
        if spree_current_user.has_role?('seller')
          @sellers = Spree::Seller.where(:id => spree_current_user.seller.id)
        end
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
        button = params[:button]
        if @seller.update_attributes(seller_params)
          if button == "approve"
            if @seller.approve_seller
              flash[:success] = Spree.t(:seller_approved)
            else
              flash[:alert] = Spree.t(:seller_not_approved)
            end
          elsif button == "unapprove"
            if @seller.unapprove_seller
              flash[:success] = Spree.t(:seller_unapproved)
              else
              flash[:alert] = Spree.t(:seller_not_unapproved)
            end
          else
            flash[:success] = "Seller updated"
          end
          redirect_to admin_sellers_path
        else
          render "edit"
        end
      end

      def destroy
        @seller = Seller.find(seller_params)
        @seller.destroy
        redirect_to admin_sellers_path, :notice => "Seller Successfully deleted"
      end

      # def approve
      #   @seller = Seller.find(params[:id])
      #   # @seller.update_attributes(:message => params[:message])
        
      #   if @seller.approve_seller
      #     flash[:success] = Spree.t(:seller_approved)
      #     redirect_to admin_sellers_path
      #   else
      #     flash[:alert] = Spree.t(:seller_not_approved)
      #     redirect_to admin_sellers_path
      #   end
      # end
  
      # def unapprove

      #   @seller = Seller.find(params[:id])

      #   if @seller.unapprove_seller
      #     flash[:success] = Spree.t(:seller_unapproved)
      #     redirect_to admin_sellers_path
      #   else
      #     flash[:alert] = Spree.t(:seller_not_unapproved)
      #     redirect_to admin_sellers_path
      #   end
      # end

    private 

      def seller_params
        params.require(:seller).permit!
      end

    end
  

  end
end