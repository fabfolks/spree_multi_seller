Spree::UserPasswordsController.class_eval do

  # def update
  #   debugger
  #   if params[:spree_user][:password].blank?
  #     set_flash_message(:error, :cannot_be_blank)
  #     render :edit
  #   end

  #   self.resource = resource_class.reset_password_by_token(resource_params)

  #   if resource.errors.empty?
  #     resource.unlock_access! if unlockable?(resource)
  #     #flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
  #     #set_flash_message(:notice, flash_message) if is_flashing_format?
  #     sign_in(resource_name, resource)
  #     respond_with resource, :location => after_resetting_password_path_for(resource)
  #   else
  #     respond_with resource
  #   end

  # end

  #   if @user.update_attributes(user_params)
  #     if params[:user][:password].present?
  #       # this logic needed b/c devise wants to log us out after password changes
  #       user = Spree::User.reset_password_by_token(params[:user])
  #       sign_in(@user, :event => :authentication, :bypass => !Spree::Auth::Config[:signout_after_password_change])
  #     end
  #     if @user.has_spree_role?('seller')
  #       redirect_to spree.edit_admin_seller_path(@user.seller), :notice => Spree.t(:account_updated)
  #     else
  #       redirect_to spree.account_url, :notice => Spree.t(:account_updated)
  #     end

  #   else
  #     render :edit
  #   end
  # end
    protected

    def after_resetting_password_path_for(resource)
      if resource.has_spree_role?('seller')
        spree.edit_admin_seller_path(resource.sellers.last)
      else
        after_sign_in_path_for(resource)
      end
    end

end