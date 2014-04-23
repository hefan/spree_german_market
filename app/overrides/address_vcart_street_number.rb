Deface::Override.new(:virtual_path => "spree/shared/_address",
                     :insert_bottom => "div.vcard div.adr div.street-address div.street-address-line",
                     :text => " <%= address.street_number %>",
                     :name => "address_vcard_street_number")
