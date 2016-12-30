class PurchaseValidator < ActiveModel::Validator
	def validate(record)
		if record.user.id == record.purchase.user.id
			record.errors[:user] << 'Cannot purchase your own product!'
		end 
	end
end