require 'globelabs_sms_rails/version'
require 'globelabs_sms_rails/configuration'
require 'globelabs_sms_rails/client'
require 'globelabs_sms_rails/errors/configuration'
require 'generators/globelabs_sms_rails/install_generator'

module GlobelabsSmsRails
	class << self
		attr_accessor :configuration
	end

	def self.configuration
		@configuration ||= Configuration.new
	end

	def self.reset
		@configuration = Configuration.new
	end

	def self.configure
		yield(configuration)
	end  
end