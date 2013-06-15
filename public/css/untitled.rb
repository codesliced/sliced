puts request.inspect
  @user = User.authenticate(params[:user])
  if @user
     session[:user_id] = @user.id
    redirect to '/'
  else
    @errors = { login_error: "Invalid Login"}
    erb :login
  end

    session[:user_id] = nil
  redirect to '/'


   new_user = User.new(params[:user])
  if new_user.save 
    session[:user_id] = new_user.id
    redirect '/'
  else
    @errors = new_user.errors
    erb :login
  end
