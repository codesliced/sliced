users = <<-USERS
lungegrammer
shotel6
fakepeet
frissata
fakehole
cppriced
dustycross
USERS


emails = <<-EMAILS
lungegrammer@gmail.com
shotel6@gmail.com
fakepeet@gmail.com
frissata@gmail.com
fakehole@gmail.com
cppriced@gmail.com
dustycross@gmail.com
EMAILS


albums = <<-ALBUMS
Turnbull Straight Up
Sideways City
Slant Francisco
Sparklevator
That SF Tree
Purple Pine Cone Pros
Lumps on a Hill
ALBUMS

photos = <<-PHOTOS
Percentrait
Seetreat
Slicedhattan
Tilden's Angels
Diablo Glow Rooster Crow
Brodeotree
Getty the shot
PHOTOS


urls = <<-URLS
http://distilleryimage6.ak.instagram.com/282682ecb9e511e2ac7c22000a1f96a8_7.jpg
http://distilleryimage0.ak.instagram.com/a33242a27a2d11e2983d22000a9f199e_7.jpg
http://distilleryimage2.ak.instagram.com/a11a85c6723811e2a12822000a9f18f6_7.jpg
http://distilleryimage4.ak.instagram.com/87faa73c4b3311e2806d22000a1f9e4d_7.jpg
http://distilleryimage2.ak.instagram.com/085f7cb44f0211e28c8422000a1f931c_7.jpg
http://distilleryimage10.ak.instagram.com/043a2bce40df11e2904b22000a1f8c1d_7.jpg
http://distilleryimage4.ak.instagram.com/f5f085d8411811e2862522000a1f9c96_7.jpg
URLS


morephotos = <<-MOREPHOTOS
Birdclapper
Remnants of today's rain
Just got home. This morning feels like a distant dream.
Just a sill full of tulips helps the medicine go down.
The Magical Forest
After you. Oh no, no, no, after youuu.
Sunrise with good friends
MOREPHOTOS


moreurls = <<-MOREURLS
http://distilleryimage11.ak.instagram.com/77bc664838b511e29f5b22000a1fc2ca_7.jpg
http://distilleryimage2.ak.instagram.com/de327820cfe811e2a84922000a1f8c0f_7.jpg
http://distilleryimage3.ak.instagram.com/da3ad342ac3f11e2882622000a1f985d_7.jpg
http://distilleryimage2.ak.instagram.com/33d3268aad5711e2b95b22000a1fab39_7.jpg
http://distilleryimage8.ak.instagram.com/128891848ad111e2a77722000a1fbc49_7.jpg
http://distilleryimage1.ak.instagram.com/36ee739e880c11e2b5c422000a1f9a53_7.jpg
http://distilleryimage5.ak.instagram.com/390b800c3b5611e28dc722000a1fbcbc_7.jpg
MOREURLS

user_seed = users.each_line.to_a
email_seed = emails.each_line.to_a
album_seed = albums.each_line.to_a
photo_seed = photos.each_line.to_a
url_seed = urls.each_line.to_a
morephotos_seed = morephotos.each_line.to_a
moreurls_seed = moreurls.each_line.to_a

user_seed.each do |u|
  user = User.create(
    username: u.strip,
    email: email_seed.shift.strip,
    :password => "password")
end

album_seed.each do |a|
  album = Album.create(
    album_name: a.strip,
    user_id: ((1..7).to_a).sample)
end

# 14.times do
#   photo = Photo.create(
#     title: photo_seed.sample.strip,
#     path: url_seed.sample.strip, 
#     album_id: ((1..7).to_a).sample
#     )
# end
albums = ((1..7).to_a).shuffle
photo_seed.each do |p|
  photo = Photo.create(
    title: p.strip,
    path: url_seed.shift.strip,
    album_id: albums.pop
    )
end

albums2 = ((1..7).to_a).shuffle
morephotos_seed.each do |p|
  photos = Photo.create(
    title: p.strip,
    path: moreurls_seed.shift.strip,
    album_id: albums2.pop
    )
end
