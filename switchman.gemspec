# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'switchman/version'

Gem::Specification.new do |spec|
  spec.name          = "switchman"
  spec.version       = Switchman::VERSION
  spec.authors       = ["Mike Kolganov"]
  spec.email         = ["mike.kolganov@gmail.com"]
  spec.description   = "Rack middleware that provides simple redirection to language URI prefix"
  spec.summary       = %q{Rack middleware that redirects user from site root to language prefix. Preferred language of user is determined by HTTP header "Accept-Language". Otherwise first configured language will be used for redirecting.}
  spec.homepage      = "https://github.com/mikekolganov/switchman"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
