class Vendor < ActiveRecord::Base
    self.table_name = 'vendor'
    self.primary_key = :vendor_id

    has_many :vendor_packages, :class_name => 'VendorPackage', :foreign_key => :vendor_id
    has_many :vendor_request_messages, :class_name => 'VendorRequestMessage', :foreign_key => :vendor_id
    has_many :vendor_seq_step_loggings, :class_name => 'VendorSeqStepLogging', :foreign_key => :vendor_id
    has_many :vendor_test_sequences, :class_name => 'VendorTestSequence', :foreign_key => :vendor_id
end
