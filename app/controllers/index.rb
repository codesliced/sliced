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

get '/user/album/:album_id' do
  @album = Album.find(params[:album_id])
  if current_user.id == @album.user_id
    erb :modify_album
  else
    redirect '/available_albums'
  end

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

# get '/delete/album/:id' do
#     @album = Album.find(params[:id])
#     p params
#     # if current_user.id == @album.user_id
#     #   @album.destroy
#     #   redirect '/'
#   # else
#   #   redirect to 'login'
#   # end
# end


get '/photo/delete/:id' do
    @photo = Photo.find(params[:id])
    # if current_user.id == @album.user_id
      @photo.destroy
      redirect back
  # else
  #   redirect to 'login'
  # end
end

post '/photo/favorite' do
  if current_user
    photo_id = params[:photo_id]
    photo = Photo.find(photo_id)
    heart = params[:heart].to_i
    hearts = photo.favorites
    Favorite.create(:photo_id => photo_id,
                    :user_id => current_user.id,
                    :heart => heart)
    redirect "/album/#{photo.album_id}"
  else
    redirect '/login'
  end
end

get '/album/upload/:album_id' do
  @album = Album.find(params[:album_id])
erb :add_photos_to_album
end

# get '/add_to_album/:album_id' do
#   if current_user
#     @album = Album.find
#     erb :add_photos_to_album
#   end
# end


post '/album/upload/:album_id' do
  @album = Album.find(params[:album_id])
  photo = Photo.new(params[:photo])
  photo.album_id = @album.id
  photo.save
  redirect "/album/#{photo.album_id}"
end
