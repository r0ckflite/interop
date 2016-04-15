class AddVendorToUser < ActiveRecord::Migration
	def change
		add_column :users, :vendor_id, :integer
		add_foreign_key :users, :vendor, column: :vendor_id, primary_key: "vendor_id"
	end
end
