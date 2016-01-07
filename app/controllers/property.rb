post '/property' do
	property = current_user.properties.new(params[:property])
	# @answer = Answer.where(property_id: params[:id])
	property.save
	redirect '/'
end

post '/edit_property' do
	if
		property =Property.owner(params[:property][:user_id],params[:property][:id])
	  	property.update(params[:property])
		property.save
		redirect to ("/property/#{property.id}")
	else 
		return "not owner of this property"
	end
end

get '/property/:id' do

	@property = Property.find_by(id: params[:id])
	@comment = Comment.where(property_id: params[:id])
	
	# @answer = Answer.where(question_id: params[:id])
	  erb :"properties/property"
end

post '/delete/property' do
	if 
		property = Property.owner(params[:property][:user_id],params[:property][:id])
		property.destroy
		redirect '/'
	else 
		return "not owner of this property"
	end
end

