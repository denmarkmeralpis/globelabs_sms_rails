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

	def self.compose(msg)
		@message = msg
	end

	def self.send_to(address)
		@address = address
		if @address.nil? || @message.nil?
			raise 'Address or message is nil'
		else
			data = {
				address: @address,
				message: @message,
				app_id: self.configuration.app_id,
				app_secret: self.configuration.app_secret,
				passphrase: self.configuration.passphrase
			}
			uri = URI.parse("https://devapi.globelabs.com.ph/smsmessaging/#{self.configuration.api_version}/outbound/#{self.configuration.short_code}/requests")
			res = Net::HTTP.post_form(uri, data)
			puts "#{data}"
			return JSON.parse(res.body).merge(http_code: res.code)
		end
	end

end
