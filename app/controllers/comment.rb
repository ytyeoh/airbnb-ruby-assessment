post '/comment' do
	comment = current_user.comments.new(desc: params[:comments][:desc], propertie_id: params[:comments][:properties_id])
	# @answer = Answer.where(property_id: params[:id])
	comment.save
	redirect to ("/property/#{comment.propertie_id}")
end

post '/edit/comment' do
	byebug
	if
		comment =Comment.find_by(propertie_id: params[:comments][:propertie_id], id: params[:comments][:id], user_id: params[:comments][:user_id] )
	  	comment.update(params[:comments])
		comment.save
		redirect to ("/property/#{comment.propertie_id}")
	else 
		return "not owner of this comment"
	end
end

post '/delete/comment' do
	if 
		comment = Comment.find_by(params[:comment])
		comment.destroy
		redirect to ("/property/#{comment.propertie_id}")
	else 
		return "not owner of this property"
	end
end

