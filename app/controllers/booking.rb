get '/booking/:id' do

	@property = Property.find_by(id: params[:id])

	@booking = Booking.find_by(propertie_id: params[:id], user_id: current_user.id)
	erb :"bookings/booking"
end

post '/booking' do

	# booking = current_user.bookings.new(desc: params[:comments][:desc], propertie_id: params[:comments][:properties_id])
	booking = current_user.bookings.new(params[:booking])
	# @answer = Answer.where(property_id: params[:id])
	booking.save
	redirect to ("/booking/#{booking.propertie_id}")
	
end

post '/delete/booking' do

	if 
		booking = Booking.find_by(params[:booking])
		booking.destroy
		redirect to ("/booking/#{booking.propertie_id}")
	else 
		return "not owner of this property"
	end
end