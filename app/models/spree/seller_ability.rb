class Spree::SellerAbility
  include CanCan::Ability

  def initialize(user)
    self.clear_aliased_actions
    alias_action :edit, to: :update
    alias_action :new, to: :create
    alias_action :new_action, to: :create
    alias_action :show, to: :read
    alias_action :delete, to: :destroy

    user ||= Spree.user_class.new
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('seller')

      #can :admin, :all

      # cannot :manage, Spree::Promotion
      # cannot :manage, Spree::Seller
      # cannot :manage, Spree::Admin::GeneralSettingsController


        can :index, Spree::Order
        can :show, Spree::Order
        can :admin, Spree::Order
        cannot :create, Spree::Order
        cannot :destroy, Spree::Order 
        #can :manage, Spree::Order

        can :index, Spree::Product
        can :show, Spree::Product
        can :admin, Spree::Product
        can :manage, Spree::Product

        can :index, Spree::Variant
        can :show, Spree::Variant
        can :admin, Spree::Variant
        can :manage, Spree::Variant

        can :index, Spree::Preference
        can :show, Spree::Preference
        can :admin, Spree::Preference
        
        can :index, Spree::Taxon
        can :show, Spree::Taxon
        can :index, Spree::Taxonomy
        # can :index, Spree::Taxonomy


        can :index, Spree::StockLocation
        can :show, Spree::StockLocation
        can :admin, Spree::StockLocation
        can :manage, Spree::StockLocation

        can :index, Spree::Image
        can :show, Spree::Image
        can :admin, Spree::Image
        can :manage, Spree::Image
        
        # can :manage, Spree::Variant do |variant|
        #   variant.product.seller_id == user.seller.id
        # end
        # #can :index, Spree::Admin::Reports
        # can :manage, Spree::Report
        # can :show, Spree::Report
        # #can :admin, Spree::Admin::Reports

        # #can :manage, Spree::Variant

        # can :manage, Spree::Adjustment

        #manage

      # can :manage, Spree::SellerOrder do |order|
      #   order.seller_id == user.seller.last.id
      # end
      # can :create, Spree::Product
      can :manage, Spree::Seller


      # can :manage, Spree::User do |spree_user|
      #   !spree_user.seller.nil? and spree_user.seller.id == user.seller.id
      # end

      # can :manage, Spree::ProductProperty do |prodcut_property|
      #   product_property.product.seller_id == user.seller.id
      # end


      # can :manage, Spree::Product do |product|
      #   product.seller_id == user.seller.id
      # end

      can :manage, Spree::OptionType
      can :manage, Spree::Property
      can :manage, Spree::Prototype
        # base_admin
        # custom_perms

        # %w/destroy/.each do |act|
        #   can act, "admin/orders"
        # end

        # can 'fire', 'cancel'
    end
  end
end
