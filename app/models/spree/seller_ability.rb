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
      can :manage, Spree::Order
      can :manage, Spree::Product do |product|
        Spree::SellerUser.find_all_by_user_id(user.id).collect(&:seller_id).include? product.seller_id
      end
    end
  end
end
