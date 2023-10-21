class ChangeDataStringToText < ActiveRecord::Migration[6.1]
  def change
    change_column_default :endusers, :bio, nil
    change_column_default :endusers, :playlist, nil
    change_column_default :endusers, :wantlist, nil
    change_column :endusers, :bio, :text
    change_column :endusers, :playlist, :text
    change_column :endusers, :wantlist, :text
  end
end
