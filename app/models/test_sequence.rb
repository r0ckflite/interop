class TestSequence < ActiveRecord::Base
    self.table_name = 'test_sequence'
    self.primary_key = :test_sequence_id
    self.inheritance_column = :ruby_type
    has_many :test_seq_steps, :class_name => 'TestSeqStep', :foreign_key => :test_sequence_id
    has_many :vendor_test_sequences, :class_name => 'VendorTestSequence', :foreign_key => :test_sequence_id
end
