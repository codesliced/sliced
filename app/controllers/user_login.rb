post '/create_user' do
  @user =User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id 
    redirect to '/available_albums'
  else
    redirect to '/'
  end
end

get '/login' do 
  puts request.class
  puts request.inspect
  erb :login
end

post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user && @user.password == params([:user][:password])
    session[:user_id] = @user.id 
    redirect to '/available_albums'
  else 
    redirect to '/'
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

