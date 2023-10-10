class AddProfilePictureToEndusers < ActiveRecord::Migration[6.1]
  def change
    add_column :endusers, :profile_picture, :attachement
  end
end
