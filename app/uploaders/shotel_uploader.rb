class ShotelUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  process :resize_to_fill => [600,600]

  version :thumb do
    process :resize_to_fill => [200,200]
  end

  storage :file

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "photos/"
  end
end
