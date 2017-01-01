class Product < ApplicationRecord
	belongs_to :user #A user creates products but a product can only belong to one user
	validates :user_id, presence: true
	has_and_belongs_to_many :categories
	validates :description, presence: true, length: { maximum: 500 }
	default_scope -> { order(created_at: :desc) }

	has_many :wishlists
    has_many :wishlist_user, :through => :wishlists,
                :source => :user

    has_many :reviews
    has_many :reviewers, :through => :reviews,
                :source => :user

    has_many :purchases
    has_many :purchased_user, :through => :purchases,
                :source => :user

    mount_uploader :avatar, AvatarUploader

    acts_as_votable


end
