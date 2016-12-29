class ReviewValidator < ActiveModel::Validator
	def validate(record)
		if record.user.id == record.review.user.id
			record.errors[:user] << 'Cannot review your own product!'
		end
	end
end