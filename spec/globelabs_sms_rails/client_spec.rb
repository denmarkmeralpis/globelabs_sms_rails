require_relative '../spec_helper'
require 'webmock/rspec'
require 'dotenv'

Dotenv.load

RSpec.describe GlobelabsSmsRails::Client do
   let(:address) { '09177710296' }
   let(:message) { 'This is a sample SMS message! Hola!' }
   let(:client) { GlobelabsSmsRails::Client.new }
   let(:data) { { address: address, message: message } }

   before do
		GlobelabsSmsRails.configure do |config|
			config.app_id = ENV['GLABS_APP_ID']
			config.app_secret = ENV['GLABS_APP_SECRET']
			config.passphrase = ENV['GLABS_PASSPHRASE']
			config.short_code = ENV['GLABS_SHORT_CODE']
		end
	end

   context 'when sending a message' do
      it 'should return a 200 http_code status' do
         stub_request(:post, 'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9440/requests').to_return(body: json_response('200.json'), status: 200, headers: {})
         response = client.send(data)

         expect(response).to have_key(:http_code)
         expect(response[:http_code]).to eq('200')
      end
   end

   context 'direct sending of message without instantiating' do
      it 'should return a 200 http_code status' do
         stub_request(:post, 'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9440/requests').to_return(body: json_response('200.json'), status: 200, headers: {})
         expect { GlobelabsSmsRails::Client.send(message: message, address: address) }
      end
   end

   context 'when app_id, passphrase, app_secret is/are invalid' do
      it 'should raise authentication error' do
         GlobelabsSmsRails.configuration.app_id = 'invalid_app_id'
         GlobelabsSmsRails.configuration.app_secret = 'invalid_app_secret'
         GlobelabsSmsRails.configuration.passphrase = 'invalid_passphrase'

         stub_request(:post, 'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9440/requests').to_raise(GlobelabsSmsRails::Errors::Authentication)
         expect { GlobelabsSmsRails::Client.send(address: address, message: message) }.to raise_error(GlobelabsSmsRails::Errors::Authentication)
      end
   end

   context 'when invalid address' do
      it 'should raise bad request error' do
         stub_request(:post, 'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9440/requests').to_raise(GlobelabsSmsRails::Errors::BadRequest)
         expect { GlobelabsSmsRails::Client.send(address: 'invalid_address_sample', message: 'Hello World!') }.to raise_error(GlobelabsSmsRails::Errors::BadRequest)
      end
   end

   context 'when message is null or blank' do
      it 'should raise bad request error' do
         stub_request(:post, 'https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9440/requests').to_raise(GlobelabsSmsRails::Errors::BadRequest)
         expect { GlobelabsSmsRails::Client.send(address: '09177710296', message: '') }.to raise_error(GlobelabsSmsRails::Errors::BadRequest)
      end
   end

   def json_response(file_name)
      File.read(File.expand_path('../../support/fixtures/' + file_name, __FILE__))
   end



end