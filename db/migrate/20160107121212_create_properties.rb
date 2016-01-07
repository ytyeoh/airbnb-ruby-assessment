class CreateProperties < ActiveRecord::Migration
	def change
	create_table :properties do |t|
		t.string :desc
		t.integer :price
		t.integer :user_id
		t.string :title
		t.timestamps null: false
	end
	end
end
