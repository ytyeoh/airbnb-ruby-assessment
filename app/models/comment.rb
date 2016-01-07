class Comment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	belongs_to :user
	belongs_to :property

	def self.own(property_id, id, user_id)
		
		 Comment.find_by(property_id: propertie_id, id: id, user_id: user_id )
	end
end
