germany = Spree::Country.find_by_iso("DE")

if germany.present?
  Spree::Zone.all.each do |z| 
    country_ids = z.country_ids
    country_ids.delete(germany.id)
    z.country_ids = country_ids
    z.save!
  end
  zone = Spree::Zone.create(name: "Deutschland", description: "Deutschland", default_tax: true)
  zone.country_ids = [germany.id]
  zone.save!


  tax_cat_1 = Spree::TaxCategory.create(name: "Standard", 
                                           description: "Standard Mehrwertsteuer Deutschland", 
                                           is_default: true)

  tax_cat_2 = Spree::TaxCategory.create(name: "Lebensmittel ", 
                                           description: "Lebensmittel Mehrwertsteuer Deutschland", 
                                           is_default: false)


  tax_rate_1 = Spree::TaxRate.create(name: "inkl. 19% MwSt.",
                                     amount: 0.19, zone: zone, tax_category: tax_cat_1,
                                     show_rate_in_label: true, included_in_price: true,
                                     calculator_type: "Spree::Calculator::DefaultTax")

  tax_rate_2 = Spree::TaxRate.create(name: "inkl. 7% MwSt.",
                                     amount: 0.07, zone: zone, tax_category: tax_cat_2,
                                     show_rate_in_label: true, included_in_price: true,
                                     calculator_type: "Spree::Calculator::DefaultTax")


  default_shipping_cat = Spree::ShippingCategory.create(name: "Standard Deutschland")

  shipping_method_1 = Spree::ShippingMethod.create(name: "Flat Deutschland", 
                                                   zones:[zone], shipping_categories: [default_shipping_cat],
                                                   calculator_type: "Spree::Calculator::Shipping::FlatRate")

end

