require_relative "./reviewValidator"
class Review < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :user_id, presence: true
	validates :product_id, presence: true
	validates :comment, presence: true, length: { maximum: 200 }

	include ActiveModel::Validations
    validates_with reviewValidator
end
