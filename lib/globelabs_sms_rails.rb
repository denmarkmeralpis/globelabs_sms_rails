require "uri"
require "net/https"
require "json"
require "globelabs_sms_rails/version"

module GlobelabsSmsRails

	class << self
		attr_accessor :configuration
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
	end

	class Configuration
		attr_accessor :short_code, :app_id, :app_secret, :passphrase, :api_version, :message, :address

		def initialize
			@short_code = ''
			@app_id = ''
			@app_secret = ''
			@api_version = 'v1'
			@passphrase = ''
			@message = ''
			@address = ''
		end
	end

	def self.send_message(address, message, customCred=nil)
		@address = address
		@message = message
		
		if @address.nil? || @message.nil?
			raise 'Address or message is nil'
		else
			unless customCred.nil?
				appId = customCred[:app_id]
				appSecret = customCred[:app_secret]
				passPhrase = customCred[:passphrase]
				shortCode = customCred[:short_code]
			else	
				appId = self.configuration.app_id
				appSecret = self.configuration.app_secret
				passPhrase = self.configuration.passphrase 
				shortCode = self.configuration.short_code
			end

			data = {
				address: @address,
				message: @message,
				app_id: appId,
				app_secret: appSecret,
				passphrase: passPhrase
			}

			uri = URI.parse("https://devapi.globelabs.com.ph/smsmessaging/#{self.configuration.api_version}/outbound/#{shortCode}/requests")
			res = Net::HTTP.post_form(uri, data)

			return JSON.parse(res.body).merge(http_code: res.code)
		end
	end

end
