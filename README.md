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
gem 'spree_german_market', :git => 'git://github.com/hefan/spree_german_market.git', :branch => '2-2-stable'
```


Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_german_market:install
```

add street number to permitted attributes in your _config/initializers/spree.rb_ (only required for 2.1 version):

```ruby
Spree::PermittedAttributes.address_attributes << :street_number
```


Setup
-----

Add products with the appropriate shipping and tax categories to your shop and you're done.

You may add the following to your application.rb:

- 'Berlin'' as the time_zone of your application (config.time_zone = 'Berlin')
- 'de' as i18n default locale of your application (config.i18n.default_locale = :de)


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


