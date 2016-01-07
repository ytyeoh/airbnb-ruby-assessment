class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :comments
	has_many :bookings
	belongs_to :user

	def self.list
		Property.order(created_at: :desc)
	end
	def self.owner(user_id, id)
		Property.find_by(user_id: user_id, id: id)
	end

end


