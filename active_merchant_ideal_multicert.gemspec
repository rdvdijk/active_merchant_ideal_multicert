# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_merchant_ideal_multicert/version"

Gem::Specification.new do |s|
  s.name        = "active_merchant_ideal_multicert"
  s.version     = ActiveMerchantIdealMulticert::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Roel van Dijk"]
  s.email       = ["roelvandijk@voormedia.com"]
  s.homepage    = ""
  s.summary     = %q{A patch for active_merchant_ideal to support multiple certificates.}
  s.description = %q{A patch for active_merchant_ideal to support multiple certificates.}

  s.rubyforge_project = "active_merchant_ideal_multicert"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
