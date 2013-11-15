Spree::Admin::UsersController.class_eval do

  def create
    if params[:user]
      roles = params[:user].delete("spree_role_ids")
    end

    @user = Spree::User.new(user_params)
    if @user.save
      if roles
        @user.spree_roles = roles.reject(&:blank?).collect{|r| Spree::Role.find(r)}
      end
      if params[:seller_id] or spree_current_user.has_role?('seller')
        seller_id = params[:seller_id] || spree_current_user.seller.id
        #seller = Spree::Seller.find(seller_id)
        seller_user = Spree::SellerUser.new(:seller_id => seller_id, :user_id => @user.id)
        seller_user.save
        redirect_to admin_users_path
      else
        flash[:success] = Spree.t(:created_successfully)
        render :edit
      end
    else
      render :new
    end
  end

  def index
    if spree_current_user.has_role?('seller')
      @users = Spree::User.includes(:seller).where("spree_sellers.id is not NULL and spree_sellers.id = #{spree_current_user.seller.id}").order(:email).page(params[:page]).per(10)
    else
      @users = Spree::User.order(:email).page(params[:page]).per(10)
    end
  end


  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

end
