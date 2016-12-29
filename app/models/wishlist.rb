require_relative "./wishlistValidator"

class Wishlist < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates :user_id, presence: true
	validates :product_id, presence: true
	include ActiveModel::Validations
    validates_with WishlistValidator
end
