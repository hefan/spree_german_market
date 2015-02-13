Spree.config do |config|

  country = Spree::Country.find_by_iso("DE")
  config.default_country_id = country.id if country.present?

  config.address_requires_state = false
  config.checkout_zone = "Deutschland"

  config.currency = "EUR"
end
