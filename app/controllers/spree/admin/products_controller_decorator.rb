Spree::Admin::ProductsController.class_eval do
	def index 
		session[:return_to] = request.url
		@collection = @collection.where(:seller_id => spree_current_user.seller.id) if @collection.present? && spree_current_user.has_role?('seller')
    respond_with(@collection)
	end



	def create
    invoke_callbacks(:create, :before)
    @product.attributes = permitted_resource_params
    @product.seller = spree_current_user.seller
    if @product.save
      invoke_callbacks(:create, :after)
      flash[:success] = flash_message_for(@product, :successfully_created)
      respond_with(@product) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      invoke_callbacks(:create, :fails)
      respond_with(@product)
    end
  end

end
