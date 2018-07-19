# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'globelabs_sms_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "globelabs_sms_rails"
  spec.version       = GlobelabsSmsRails::VERSION
  spec.authors       = ["Nujian Den Mark Meralpis"]
  spec.email         = ["meralpisdenmark@gmail.com"]
  
  spec.summary       = "A simple gem for sending SMS through Globe Labs API."
  spec.homepage      = "https://github.com/denmarkmeralpis/globelabs_sms_rails"
  spec.description   = "This gem will help you send SMS using Globe Labs API. Please take note that this gem will work if the subscriber consent workflow is disabled. You can apply the process by asking Globe"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://github.com/denmarkmeralpis/globelabs_sms_rails"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "dotenv", "~> 2.5"
  spec.add_development_dependency "webmock", "~> 3.4"
  spec.add_development_dependency "rails", "~> 4.2"
end
