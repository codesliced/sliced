# post '/create_user' do
#   @user =User.new(params[:user])
#   if @user.save
#     session[:user_id] = @user.id 
#     redirect to '/create_album'
#   else
#     redirect to '/available_albums'
#   end
# end

# get '/login' do 
#   puts request.class
#   puts request.inspect
#   erb :login
# end

# post '/login' do
#   if User.authenticate(params[:user])
#     session[:user_id] = @user.id 
#     redirect to '/create_album'
#   else 
#     redirect to '/available_albums'
#   end
# end


# get '/logout' do
#   session[:user_id] = nil
#   redirect to '/available_albums'
# end

