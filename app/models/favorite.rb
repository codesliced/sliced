class Favorite < ActiveRecord::Base
  belongs_to :photo
  belongs_to :fan, :class_name => "User", :foreign_key => :user_id 
end
