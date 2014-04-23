Deface::Override.new(:virtual_path => "spree/admin/shared/_address",
                     :replace_contents => "[data-hook='address']",
                     :partial => "/store/admin/display_address",
                     :name => "admin_address_display_street_number")
