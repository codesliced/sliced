get '/' do
  redirect to '/available_albums'
end


get '/available_albums' do
  @albums = Album.all
erb :all_albums
end


get '/user/:user_id' do
  user_id = params[:user_id]
    
erb :user_profile
end


get '/album/:album_id' do
  @album = Album.find(params[:album_id])

erb :album_page
end


get '/create_album' do
  if current_user
    erb :create_album
  else
    redirect to '/login'
  end
end


post '/create_album' do
  album = Album.new(params[:album])
  album.user_id = current_user.id
  album.save

  photo = Photo.new(params[:photo])
  photo.album_id = album.id
  photo.save

  redirect "/album/#{album.id}"
end


get '/album/:album_id/upload' do
  
erb :upload_photo
end


post '/album/:album_id/upload' do
  
end
