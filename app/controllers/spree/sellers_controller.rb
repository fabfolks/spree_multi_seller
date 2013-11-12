module Spree
  class SellersController < Spree::StoreController
      respond_to :html
      include Spree::Core::ControllerHelpers
      # def index
      # end


      def new
        @seller = Seller.new
      end

      def create
        @seller = Seller.new seller_params
        #generated_password = Devise.friendly_token.first(8)
        if @seller.save!
          #redirect_to new_admin_seller_store_address_path(@seller)
          #redirect_to signup_path(:seller_id => @seller.id)
         # user = Spree::User.new(:email => @seller.contact_person_email, :password => generated_password)
          # if user.save!
          #   if current_order
          #     session[:guest_token] = nil
          #   end
          flash[:success] = Spree.t(:seller_creted)
          redirect_back_or_default(root_url)
           # else
           #  flash[:alert] = Spree.t(:seller_user_not_created)  
          #end
        else
          flash[:alert] = Spree.t(:seller_not_created)          
          render "new"
        end
      end

      # def edit
      # end

      # def update
      #   @seller = Seller.find(params[:id])
      #   if @seller.update_attributes(seller_params)
      #     redirect_to admin_sellers_path, :notice => "Seller updated"
      #   else
      #     render "edit"
      #   end
      # end

      # def destroy
      #   @seller = Seller.find(seller_params)
      #   @seller.destroy
      #   redirect_to admin_sellers_path, :notice => "Seller Successfully deleted"
      # end

  private 

      def seller_params
        params.require(:seller).permit!
      end

  end

end