class CreateComments < ActiveRecord::Migration
	def change
	create_table :comments do |t|
		t.string :desc
		t.integer :user_id
		t.integer :propertie_id
		t.timestamps null: false
	end

	end
end