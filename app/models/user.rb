class User < ApplicationRecord
	has_secure_password

	has_many :posts
	has_many :comments

	accepts_nested_attributes_for :posts, allow_destroy: true
	accepts_nested_attributes_for :comments, allow_destroy: true

	validates :email, presence: true, uniqueness: true
end
