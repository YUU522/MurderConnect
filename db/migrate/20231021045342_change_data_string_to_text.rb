class ChangeDataStringToText < ActiveRecord::Migration[6.1]
  def change
    change_column :endusers, :bio, :text
    change_column :endusers, :playlist, :text
    change_column :endusers, :wantlist, :text
  end
end
