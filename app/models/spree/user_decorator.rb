Spree::User.class_eval do

  #has_one :seller_user
  has_many :approved_sellers, :foreign_key => 'owner_id',:class_name=> "Spree::Seller"
  has_and_belongs_to_many :sellers, :join_table => "spree_seller_users"#, :uniq => true#, :dependent => :destroy

	#scope :seller_user, Spree::User.includes(:spree_roles).where("spree_roles.name = 'seller'")

	def seller
		self.sellers.last
	end

	def has_role?(role_in_question)
  	spree_roles.any? { |role| role.name == role_in_question.to_s }
  end

end
