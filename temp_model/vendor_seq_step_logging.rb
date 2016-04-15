class VendorSeqStepLogging < ActiveRecord::Base
    self.table_name = 'vendor_seq_step_logging'
    self.primary_key = :vendor_seq_step_logging_id

    belongs_to :vendor_test_seq_step, :class_name => 'VendorTestSeqStep', :foreign_key => :vendor_test_seq_steps_id
    belongs_to :vendor, :class_name => 'Vendor', :foreign_key => :vendor_id
end
