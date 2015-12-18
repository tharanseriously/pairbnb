class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :room_type
    	t.string :address
    	t.integer :user_id

      	t.timestamps null: false
    end
  end
end
