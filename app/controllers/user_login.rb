post '/create_user' do
  user = User.new(params[:user])
  if user.save
    session.clear
    session[:user_id] = user.id
    redirect '/create_album'
  else
    redirect '/available_albums'
  end
end

get '/login' do 
  puts request.class
  puts request.inspect
  erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end


post '/login' do
  user = User.authenticate(params[:user])
  if user
    session.clear
    session[:user_id] = user.id
    redirect '/create_album'
  else
    redirect '/'
  end
end


