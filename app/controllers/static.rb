get '/' do
	@property = Property.list
  erb :"static/index"
end
