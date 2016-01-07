class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :property

def self.own?(id,user_id)

	a=Booking.where(property_id: id, user_id:user_id)
	a.empty?
end
end
