get '/' do
  redirect to '/available_albums'

end

get '/available_albums' do
  @albums = Album.all
erb :all_albums
end


get '/user/:user_id' do
  @user = User.find(params[:user_id])
  @albums_by_user = @user.albums
    
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

post '/delete/:id' do
    @album = Album.find(params[:id])
    if current_user.id == @album.user_id
      @event.destroy
      redirect '/'
  else
    redirect to 'login'
  end
end


post '/photo/delete/:id' do
    @photo = Photo.find(params[:id])
    if current_user.id == @album.user_id
      @event.destroy
      redirect '/'
  else
    redirect to 'login'
  end
end

post '/photo/favorite' do
  user_id = current_user.id
  photo_id = params[:photo_id]
  photo = Photo.find(photo_id)
  heart = params[:heart].to_i
  hearts = photo.favorites
  Favorite.create(:photo_id => photo_id,
                  :user_id => user_id,
                  :heart => heart)
  redirect "/album/#{photo.album_id}"
end

get '/album/:album_id/upload' do
  
erb :upload_photo
end


post '/album/:album_id/upload' do
  
end
