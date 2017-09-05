# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'globelabs_sms_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "globelabs_sms_rails"
  spec.version       = GlobelabsSmsRails::VERSION
  spec.authors       = ["Nujian Den Mark Meralpis"]
  spec.email         = ["meralpisdenmark@gmail.com"]
  spec.summary       = %q{Sending SMS using Globe Labs API.}
  spec.description   = %q{A way of sending sms using Globe Labs API}
  spec.homepage      = "https://github.com/denmarkmeralpis"
  spec.license       = "MIT"
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end
end
