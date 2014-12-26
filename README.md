SpreeGermanMarket
=================

Extends the spreecommerce for being more german market ready. Assumes a german country.

- Alters the address fields
- Change the final save and continue button caption
- Adds some declarations and translations.
- Adds a german zone, german tax categories/rates and a default flat german shipping method.
- Remove germany from all other zones.
- Set germany as default checkout zone and default country id.
- Sets Euro (EUR) as default currency


Installation
------------

Add spree_german_market to your Gemfile:

```ruby
gem 'spree_german_market', :git => 'git://github.com/hefan/spree_german_market.git'
```

For a specific version use the appropriate branch, for example

```ruby
gem 'spree_german_market', :git => 'git://github.com/hefan/spree_german_market.git', :branch => '2-0-stable'
```


Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_german_market:install
```


Setup
-----

Add products with the appropriate shipping and tax categories to your shop and you're done.

You may add the following to your application.rb:

- 'de' as i18n default locale of your application `config.i18n.default_locale = :de`
  - you have to add spree_i18n for that, see https://github.com/spree/spree_i18n

- 'Berlin' as the time_zone of your application `config.time_zone = 'Berlin'`


Convert products
----------------

If you want to move all existing Products
 - in the newly created shipping category
 - in the newly created tax category

and set all currencies to "EUR" (without altering the prices) use

```shell
bundle exec rails g spree_german_market:convert_products
```


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_german_market/factories'
```
