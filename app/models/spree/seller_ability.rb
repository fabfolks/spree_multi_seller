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
      
      can :manage, :all

        can :index, Spree::Order
        can :show, Spree::Order
        can :admin, Spree::Order

        can :index, Spree::Product
        can :show, Spree::Product
        can :admin, Spree::Product

        #can :index, Spree::Admin::Reports
        can :manage, Spree::Report
        can :show, Spree::Report
        #can :admin, Spree::Admin::Reports

        #can :manage, Spree::Variant
        can :index, Spree::Variant
        can :show, Spree::Variant
        can :admin, Spree::Variant

        can :manage, Spree::Adjustment

        can :index, Spree::Taxon
        can :index, Spree::Taxonomy
        #manage

      # can :manage, Spree::SellerOrder do |order|
      #   order.seller_id == user.seller.last.id
      # end
      # can :create, Spree::Product
      # can :manage, Spree::Product do |product|
      #   product.seller_id == user.seller.id
      # end
      # can :manage, Spree::User do |spree_user|
      #   !spree_user.seller.nil? and spree_user.seller.last.id == user.seller.last.id
      # end
      can :manage, Spree::ProductProperty do |prodcut_property|
        product_property.product.seller_id == user.seller.id
      end
      can :manage, Spree::Variant do |variant|
        variant.product.seller_id == user.seller.id
      end
      
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
