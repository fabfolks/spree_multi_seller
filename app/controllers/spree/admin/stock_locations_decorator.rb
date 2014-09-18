

Spree::Admin::StockLocationsController.class_eval do 

	def index
    if spree_current_user.has_role?('seller')
      @stock_locations = Spree::StockLocation.where(:seller_id => spree_current_user.seller.id)
    end
	end
	
  def create
    invoke_callbacks(:create, :before)
    @stock_location.attributes = permitted_resource_params
    @stock_location.seller = spree_current_user.seller
    if @stock_location.save
      invoke_callbacks(:create, :after)
      flash[:success] = flash_message_for(@stock_location, :successfully_created)
      respond_with(@stock_location) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      invoke_callbacks(:create, :fails)
      respond_with(@stock_location)
    end
  end

end