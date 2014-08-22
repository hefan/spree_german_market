Spree.config do |config|

  country = Spree::Country.find_by_iso("DE")
  config.default_country_id = country.id if country.present?

  config.address_requires_state = false
  config.checkout_zone = "Deutschland"

  config.currency = "EUR"
  config.display_currency = false
  config.currency_symbol_position = "after"
  config.currency_decimal_mark = ","
  config.currency_thousands_separator = "."
end
