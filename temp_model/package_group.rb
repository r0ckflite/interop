class PackageGroup < ActiveRecord::Base
    self.table_name = 'package_group'
    self.primary_key = :package_group_id

    has_many :messages, :class_name => 'Message', :foreign_key => :package_group_id
    belongs_to :package, :class_name => 'Package', :foreign_key => :package_id
end
