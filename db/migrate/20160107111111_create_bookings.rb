class CreateBookings < ActiveRecord::Migration
	def change
	create_table :bookings do |t|
		t.datetime :check_in
		t.datetime :check_out
		t.integer :guests
		t.integer :user_id
		t.integer :propertie_id
		t.timestamps null: false
	end
	end
end
