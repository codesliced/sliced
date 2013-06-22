class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  # def photos=(attrs)
  #   attrs.each { |attr| self.photos.build(:image => attr)}
  # end


end
