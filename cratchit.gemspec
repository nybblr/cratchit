# -*- encoding: utf-8 -*-
require File.expand_path("../lib/cratchit/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "cratchit"
  s.version     = Cratchit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Jonathan Martin"
  s.email       = "me@nybblr.com"
  s.homepage    = "http://rubygems.org/gems/cratchit"
  s.summary     = "RubyMoney is easily the best money class for Ruby out there, but implementation as an ActiveRecord datatype has traditionally been prone to bugs and core level hacks. This gem aims to bring the incredible foundation of RubyMoney into the slick Ruby on Rails framework by exposing money as an ActiveRecord column type."
  s.description = "Ruby on Rails friendly money for ActiveRecord, built on RubyMoney."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "cratchit"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_dependency "money", ">= 3.7.1"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
