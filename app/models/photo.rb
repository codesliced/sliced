class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :file, ShotelUploader
  has_many :favorites
  has_many :fans, :through => :favorites
end
