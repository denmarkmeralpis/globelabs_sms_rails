require 'net/http'
require 'json'

module GlobelabsSmsRails
   class Client
      attr_accessor :app_id, :app_secret, :passphrase, :short_code, :host, :address, :message
      MSG_PARAMS = {}

      def initialize(options = {})
         @app_id = GlobelabsSmsRails.configuration.app_id
         @app_secret = GlobelabsSmsRails.configuration.app_secret
         @passphrase = GlobelabsSmsRails.configuration.passphrase
         @short_code = GlobelabsSmsRails.configuration.short_code
         @host = "https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/#{short_code}/requests"
      end

      def send(options)
         @address = options.fetch(:address)
         @message = options.fetch(:message)
         uri = URI(host)

         request = Net::HTTP.post_form(uri, message_params)
         response = JSON.parse(request.body, symbolize_names: true)

         if response.has_key?(:http_code)
            case response[:http_code].to_i
            when 400
               raise Errors::BadRequest, response[:error]
            when 401
               raise Errors::Authentication, response[:error]
            else
               raise StandardError, response[:error]
            end
         else
            response.merge!(http_code: '200')
         end
      end

      def self.send(options={})
         obj = self.new(options)
         return obj.send(options)
      end

      private

      def message_params
         MSG_PARAMS['app_id'] = app_id
         MSG_PARAMS['app_secret'] = app_secret
         MSG_PARAMS['passphrase'] = passphrase
         MSG_PARAMS['address'] = address
         MSG_PARAMS['message'] = message
         MSG_PARAMS
      end
   end
end