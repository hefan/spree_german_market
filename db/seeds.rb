germany = Spree::Country.find_by_iso("DE")

if germany.present?
  Spree::Zone.all.each do |z| 
    z.members.each do |m| 
      m.destroy! if m.eql? germany
    end   
  end
  
  zone = Spree::Zone.find_or_create_by_name("Deutschland")
  zone.description = "Deutschland"
  zone.default_tax = true
  german_member = Spree::ZoneMember.create(:zoneable_type => "Spree::Country", 
                                           :zoneable_id => germany.id,
                                           :zone_id => zone.id)
  zone.members << german_member
  zone.save!

  tax_cat_1 = Spree::TaxCategory.find_or_create_by_name("Standard") 
  tax_cat_1.deleted_at = false
  tax_cat_1.description = "Standard Mehrwertsteuer Deutschland"
  tax_cat_1.is_default = true
  tax_cat_1.save!

  tax_cat_2 = Spree::TaxCategory.find_or_create_by_name("Lebensmittel") 
  tax_cat_2.deleted_at = false
  tax_cat_2.description = "Lebensmittel Mehrwertsteuer Deutschland"
  tax_cat_2.is_default = false
  tax_cat_2.save!

  tax_rate_1 = Spree::TaxRate.find_or_create_by_name("inkl. 19% MwSt.")
  tax_rate_1.amount = 0.19
  tax_rate_1.zone = zone
  tax_rate_1.tax_category = tax_cat_1
  tax_rate_1.show_rate_in_label = true
  tax_rate_1.included_in_price = true
  tax_rate_1.calculator_type = "Spree::Calculator::DefaultTax"
  tax_rate_1.save!

  tax_rate_2 = Spree::TaxRate.find_or_create_by_name("inkl. 7% MwSt.")
  tax_rate_2.amount = 0.07
  tax_rate_2.zone = zone
  tax_rate_2.tax_category = tax_cat_2
  tax_rate_2.show_rate_in_label = true
  tax_rate_2.included_in_price = true
  tax_rate_2.calculator_type = "Spree::Calculator::DefaultTax"
  tax_rate_2.save!


  default_shipping_cat = Spree::ShippingCategory.find_or_create_by_name("Standard Deutschland")

  shipping_method_1 = Spree::ShippingMethod.find_or_create_by_name("Flat Deutschland") 
  shipping_method_1.deleted_at = false
  shipping_method_1.zone = zone
  shipping_method_1.shipping_category = default_shipping_cat
#  shipping_method_1.calculator_type = "Spree::Calculator::Shipping::FlatRate"
#  shipping_method_1.calculator = Spree::Calculator::FlatRate ?
  shipping_method_1.save!

end



