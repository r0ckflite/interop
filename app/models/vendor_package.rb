class VendorPackage < ActiveRecord::Base

    self.primary_key = :vendor_packages_id

    belongs_to :package, :class_name => 'Package', :foreign_key => :package_id
    belongs_to :vendor, :class_name => 'Vendor', :foreign_key => :vendor_id
end
