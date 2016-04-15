class MessageLog < ActiveRecord::Base
    self.table_name = 'message_log'
    self.primary_key = :message_log_id

    belongs_to :message, :class_name => 'Message', :foreign_key => :message_id
end
