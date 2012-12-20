# == Info ===========================================================
# This gem was developed by Jonathan Martin for use in a company eCommerce project.
# 
# RubyMoney is easily the best money class for Ruby out there, but implementation as an ActiveRecord datatype has traditionally been prone to bugs and core level hacks. This gem aims to bring the incredible foundation of RubyMoney into the slick Ruby on Rails framework by exposing money as an ActiveRecord column type.
# 
# Be sure to check out www.nybblr.com for other Rails goodies, and if you're looking for more of my gems (when I get around to it!) go to nybblr.com/gems.

require 'money'

module Cratchit
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
		# == Usage ==========================================================
		# From your ActiveRecord model, simply call the money method:
		# 
		# class Product < ActiveRecord::Base
		# 	# Example usages
		# 	money :price
		# 
		# 	money :price, :default => :zero
		# 
		# 	money :price, :default => 10.99
		# 
		# 	money :price, :default => Money.new(10, "EUR")
		# 
		# 	money :price, :cents => "rate_in_cents", :include_prefix => false
		# 
		# end
		
    def money method, opts = {}
    	options = { :include_prefix => true, :default => nil }
    	options.merge! opts
		
		  options[:cents] ||= options[:include_prefix] ? method.to_s+'_cents' : 'cents'
		  options[:currency] ||= options[:include_prefix] ? method.to_s+'_currency' : 'currency'
		  
		  default = case options[:default]
		  	when :zero then Money.new(0)
		  	when nil then nil
		  	else options[:default].to_money
		  end
		  
		  composed_of method.to_sym,
		  	:class_name => "Money",
		  	:allow_nil => true,
		  	:mapping => [ [ options[:cents], 'cents' ], [ options[:currency], 'currency_as_string' ] ],
		  	:converter => Proc.new { |value| value.respond_to?(:to_money) ? (value.to_money unless value.blank?) : raise(ArgumentError, "Can't convert #{value.class} to Money") }
		  
      after_initialize do
				send "#{method}=".to_sym, default if send(method.to_sym).nil?
      end
    end
  end
end

# Include as a model instance method
class ActiveRecord::Base
  include Cratchit
end