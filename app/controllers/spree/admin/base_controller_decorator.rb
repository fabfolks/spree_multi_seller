Spree::Admin::BaseController.class_eval do
	before_filter :check_seller_approve


	def check_seller_approve
	  if spree_current_user.has_role?('seller')
	    if spree_current_user.seller.active == false
	    	#flash[:alert] = "Please wait approve for seller"
	    	flash[:notice] = Spree.t(:seller_unapproved_login)
        redirect_back_or_default(root_url)
	    end
	  end		
	end

end