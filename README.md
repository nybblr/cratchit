Cratchit
========
This gem was developed by Jonathan Martin for use in a company eCommerce project.

RubyMoney is easily the best money class for Ruby out there, but implementation as an ActiveRecord datatype has traditionally been prone to bugs and core level hacks. This gem aims to bring the incredible foundation of RubyMoney into the slick Ruby on Rails framework by exposing money as an ActiveRecord column type.

Recently, a [nice gem](https://github.com/RubyMoney/money-rails) came out to handle the same thing, and even came with a nice money type for migrations. However, by default it does not assume currency and does not appear to have form serialization support.

Be sure to check out [nybblr.com](http://nybblr.com) for other Rails goodies, and if you're looking for more of my gems (when I get around to it!) take a stroll around my GitHub repos.

Usage
=====
From your ActiveRecord model, simply call the money method:

``` ruby
class Product < ActiveRecord::Base
	# Example usages
	money :price

	money :price, :default => :zero

	money :price, :default => 10.99

	money :price, :default => Money.new(10, "EUR")

	money :price, :cents => "rate_in_cents", :include_prefix => false

end
```
