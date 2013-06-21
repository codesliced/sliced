class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |f|
      f.references :user
      f.references :photo
      f.integer :heart
      f.timestamps
    end
  end
end
