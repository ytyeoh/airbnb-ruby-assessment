get '/booking/:id' do

	@property = Property.find_by(id: params[:id])

	@booking = Booking.find_by(property_id: params[:id], user_id: current_user.id)
	erb :"bookings/booking"
end

get '/booking/show/:id' do

	@booking = Booking.where(user_id: current_user.id)
	erb :"bookings/show"

end

post '/booking' do
byebug
	# booking = current_user.bookings.new(desc: params[:comments][:desc], property_id: params[:comments][:propertys_id])
	booking = current_user.bookings.new(params[:booking])
	# @answer = Answer.where(property_id: params[:id])
	booking.save
	redirect to ("/booking/#{booking.property_id}")
	
end

post '/booking/edit' do

if
		booking =Booking.find_by(id: params[:booking][:id], user_id: current_user.id, property_id: params[:booking][:property_id])
	  	booking.update(params[:booking])
		booking.save
		redirect to ("/booking/#{booking.property_id}")
	else 
		return "not owner of this comment"
	end
end

post '/delete/booking' do

	if 
		booking = Booking.find_by(params[:booking])
		booking.destroy
		redirect to ("/booking/#{booking.property_id}")
	else 
		return "not owner of this property"
	end
end