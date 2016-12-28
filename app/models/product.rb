class Product < ApplicationRecord
	belongs_to :user #A user creates products but a product can only belong to one user
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 500 }
	default_scope -> { order(created_at: :desc) }
end
