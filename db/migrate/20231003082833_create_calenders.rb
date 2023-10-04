class CreateCalenders < ActiveRecord::Migration[6.1]
  def change
    create_table :calenders do |t|

      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      
      t.timestamps
    end
  end
end
