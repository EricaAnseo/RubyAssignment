class WishlistValidator < ActiveModel::Validator
	def validate(record)
		if record.user.id == record.product.user.id
			record.errors[:user] << 'Cannot add your own product to your wishlist!'
		end
	end
end