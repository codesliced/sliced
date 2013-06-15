class CreatePhotos < ActiveRecord::Migration
  def change
     create_table :photos do |t|

      t.integer :album_id
      t.string   :title
      t.string :path
      t.string :file
      t.timestamps
   end   
  end
end
