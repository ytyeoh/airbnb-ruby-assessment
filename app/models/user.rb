class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :bookings
	has_many :comments
	has_many :properties
	has_secure_password


	 validates :email, presence: true, uniqueness: true
	 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	 validates :password, presence: true
end
