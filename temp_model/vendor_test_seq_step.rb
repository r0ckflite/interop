class VendorTestSeqStep < ActiveRecord::Base

    self.primary_key = :vendor_test_seq_steps_id

    has_many :vendor_seq_step_loggings, :class_name => 'VendorSeqStepLogging', :foreign_key => :vendor_test_seq_steps_id
    belongs_to :test_seq_step, :class_name => 'TestSeqStep', :foreign_key => :test_seq_step_id
    belongs_to :vendor_test_sequence, :class_name => 'VendorTestSequence', :foreign_key => :vendor_test_sequences_id
end
