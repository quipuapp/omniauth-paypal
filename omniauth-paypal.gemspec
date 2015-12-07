# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/paypal/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-paypal'
  s.version  = OmniAuth::PayPal::VERSION
  s.authors  = ['David W. Allen']
  s.email    = ['david@datariot.io']
  s.summary  = 'PayPal Identity strategy for OmniAuth'
  s.homepage = 'https://github.com/datariot/omniauth-paypal'
  s.licenses = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = "2.4.8"
  s.date = "2015-12-03"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.4"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.4"])
      s.add_dependency(%q<rspec>, ["~> 3.3.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.4"])
    s.add_dependency(%q<rspec>, ["~> 3.3.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
