Spree::Admin::UsersController.class_eval do
	
	def create
		if params[:user]
			roles = params[:user].delete("spree_role_ids")
		end

		@user = Spree::User.new(params[:user])
		if @user.save
			if roles
			@user.spree_roles = roles.reject(&:blank?).collect{|r| Spree::Role.find(r)}
			end
			unless params[:seller_id].blank?
				seller = Spree::Seller.find(params[:seller_id])
        seller_user = Spree::SellerUsers.new(:seller_id => params[:seller_id], :user_id => @user.id)
        seller_user.save
				redirect_to admin_sellers_path
			else
				flash.now[:success] = Spree.t(:created_successfully)
				render :edit
			end
		else
			render :new
		end
  end
end
