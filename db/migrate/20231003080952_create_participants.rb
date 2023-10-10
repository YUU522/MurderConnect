class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.integer :enduser_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
