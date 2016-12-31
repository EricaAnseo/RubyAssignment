class User < ApplicationRecord
	attr_accessor :remember_token
	# Association with Product. A user can add many products
	has_many :products, dependent: :destroy
	has_many :wishlists
    has_many :wishlisted_products, :class_name => "Product", :through => :wishlists, :source => :product
    has_many :reviews
    has_many :reviewed_products, :class_name => "Product", :through => :reviews, :source => :product
    has_many :purchases
    has_many :purchase_products, :class_name => "Product", :through => :purchases, :source => :product


	validates :name, presence: true, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    mount_uploader :avatar, AvatarUploader

    # Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                              BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

  	# Remembers a user in the database for use in persistent sessions.
  	def remember
	    self.remember_token = User.new_token
	    update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forget a user session.
	def forget
		update_attribute(:remember_digest, nil)
	end

	def feed
        Product.where("user_id = ?", id)
    end

end
