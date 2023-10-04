class CreateEndUsers < ActiveRecord::Migration[6.1]
  def change
     create_table :end_users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false # パスワードをハッシュ化して保存
      t.string :bio, null: false
      t.references :playlist, foreign_key: true # プレイリストへの外部キー
      t.references :wantlist, foreign_key: true # 希望リストへの外部キー
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
