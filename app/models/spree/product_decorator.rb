Spree::Product.class_eval do
	#attr_accessible :seller_id, :created_by, :updated_by
 
 	#validates_presence_of :seller_id, :created_by, :updated_by
	belongs_to :seller

	validates :seller, presence: true

	before_validation :fill_default


	def fill_default
		if !self.tax_category 
			self.tax_category  = Spree::TaxCategory.find_or_create_by(:is_default=>true, :name=>"Default")
		end
		if !self.shipping_category
			self.shipping_category  = Spree::ShippingCategory.find_or_create_by(:name=>"Default")
		end
	end

	# belongs_to :created, :foreign_key => "created_by", :class_name => "Spree::User"
	# belongs_to :updated, :foreign_key => "updated_by", :class_name => "Spree::User"
end