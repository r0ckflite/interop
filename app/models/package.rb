class Package < ActiveRecord::Base
    self.table_name = 'package'
    self.primary_key = :package_id

    has_many :package_groups, :class_name => 'PackageGroup', :foreign_key => :package_id
    has_many :vendor_packages, :class_name => 'VendorPackage', :foreign_key => :package_id
end
