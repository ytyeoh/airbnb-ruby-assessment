post '/comment' do

	comment = current_user.comments.new(desc: params[:comments][:desc], property_id: params[:comments][:property_id])
	# @answer = Answer.where(property_id: params[:id])
	comment.save
	redirect to ("/property/#{comment.property_id}")
end

post '/edit/comment' do
	if
		comment =Comment.find_by(property_id: params[:comments][:property_id], id: params[:comments][:id], user_id: params[:comments][:user_id] )
	  	comment.update(params[:comments])
		comment.save
		redirect to ("/property/#{comment.property_id}")
	else 
		return "not owner of this comment"
	end
end

post '/delete/comment' do
	if 
		comment = Comment.find_by(params[:comment])
		comment.destroy
		redirect to ("/property/#{comment.property_id}")
	else 
		return "not owner of this property"
	end
end

