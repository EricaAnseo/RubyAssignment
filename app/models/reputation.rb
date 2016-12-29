class Reputation < ApplicationRecord
	belongs_to :user
	has_one :reviewer, :class_name => "User"
	has_one :reviewee, :class_name => "User"
end
