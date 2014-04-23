Deface::Override.new(:virtual_path => "spree/checkout/_payment",
                     :replace_contents => "[data-hook='buttons']",
                     :partial => "/store/buy_button",
                     :name => "buy_button")
