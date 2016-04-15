class TestSeqStep < ActiveRecord::Base
    self.table_name = 'test_seq_step'
    self.primary_key = :test_seq_step_id

    belongs_to :test_sequence, :class_name => 'TestSequence', :foreign_key => :test_sequence_id
    belongs_to :message, :class_name => 'Message', :foreign_key => :in_message_id
    belongs_to :test_seq_step, :class_name => 'TestSeqStep', :foreign_key => :next_step_id
    has_many :vendor_test_seq_steps, :class_name => 'VendorTestSeqStep', :foreign_key => :test_seq_step_id
end
