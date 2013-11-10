# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_invoice/version"

Gem::Specification.new do |s|
  s.name        = "simple_invoice"
  s.version     = SimpleInvoice::VERSION
  s.authors     = ["Joel Plane"]
  s.email       = ["joel.plane@gmail.com"]
  s.homepage    = "https://github.com/joelplane/simple_invoice"
  s.summary     = %q{simple invoice library}
  s.description = %q{Very simple invoice library with minimal dependencies}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
