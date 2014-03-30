SpreeGermanMarket
=================

Extends the spreecommerce for being more german market ready. Alters the address fields, the button captions and some translations. Adds a german zone, german tax categories/rates and a default german shipping category/method.


Installation
------------

Add spree_german_market to your Gemfile:

```ruby
gem 'spree_german_market', :git => 'git://github.com/hefan/spree_german_market.git' 
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_german_market:install
```

Setup
-----

You have to enter the following data in your payone merchant backend portal configuration:

- Tick the "FinanceGate Frontend" checkbox.
- Enter Success-URL: http://youshopdomain/payone_frontend/success?oid=__param__
- Enter Cancel-URL: http://youshopdomain/payone_frontend/cancel
- Enter Transaction-Status-URL: http://youshopdomain/payone_frontend/status

Navigate to Spree Backend/Configuration/Payment Methods and add a new payment method with Provider "Spree::PaymentMethod::PayoneFrontend".

Enter the Portal id, the sub account id and the secret key from your payone account. Supported modes are "test" and "live". The other options should be fine by default.


Todo
-----

- Add Transaction Logs


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_german_market/factories'
```


