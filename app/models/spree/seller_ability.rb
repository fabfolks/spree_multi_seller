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
      #can :manage, :all
      can :manage, Spree::Order
      can :manage, Spree::Product do |product|
        product.seller_id == user.seller.id
      end
      can :manage, Spree::User do |spree_user|
        !spree_user.seller.nil? and spree_user.seller.id == user.seller.id
      end
      can :manage, Spree::ProductProperty do |prodcut_property|
        product_property.product.seller_id == user.seller.id
      end
      can :manage, Spree::Variant do |variant|
        variant.product.seller_id == user.seller.id
      end
      can :manage, Spree::Report
    end
  end
end
