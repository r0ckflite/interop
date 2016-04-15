class VendorTestSequence < ActiveRecord::Base

    self.primary_key = :vendor_test_sequences_id

    has_many :vendor_test_seq_steps, :class_name => 'VendorTestSeqStep', :foreign_key => :vendor_test_sequences_id
    belongs_to :test_sequence, :class_name => 'TestSequence', :foreign_key => :test_sequence_id
    belongs_to :vendor, :class_name => 'Vendor', :foreign_key => :vendor_id
end
