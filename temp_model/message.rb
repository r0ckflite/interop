class Message < ActiveRecord::Base
    self.table_name = 'message'
    self.primary_key = :message_id

    belongs_to :package_group, :class_name => 'PackageGroup', :foreign_key => :package_group_id
    has_many :message_logs, :class_name => 'MessageLog', :foreign_key => :message_id
    has_many :test_seq_steps, :class_name => 'TestSeqStep'
    has_many :vendor_request_messages, :class_name => 'VendorRequestMessage', :foreign_key => :message_id
end
