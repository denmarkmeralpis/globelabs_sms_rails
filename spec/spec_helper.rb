require 'bundler/setup'
require 'globelabs_sms_rails'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.expose_dsl_globally = true
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    GlobelabsSmsRails.configure do |config|
      config.passphrase = ENV['GLABS_PASSPHRASE']
      config.app_id = ENV['GLABS_APP_ID']
      config.app_secret = ENV['GLABS_APP_SECRET']
      config.short_code = ENV['GLABS_SHORT_CODE']
    end
  end
end

