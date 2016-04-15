class VendorRequestMessage < ActiveRecord::Base
    self.table_name = 'vendor_request_message'
    self.primary_key = :vendor_recent_message_id

    belongs_to :message, :class_name => 'Message', :foreign_key => :message_id
    belongs_to :vendor, :class_name => 'Vendor', :foreign_key => :vendor_id
end
