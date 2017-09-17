require 'spec_helper'

describe GlobelabsSmsRails do
	subject { GlobelabsSmsRails }

	describe '#send_to' do
		before {
			subject.configure do |config|
				config.app_id = ''
				config.app_secret = ''
				config.passphrase = ''
				config.short_code = ''
			end
		}
		let(:message) { 'Hello world! FROM DEFAULT CONFIG' }
		let(:address) { '639778198061' }
		let(:output) { 
			subject.send_message(address, message)
		}

		it 'should return TRUE' do
			expect(output[:http_code]).to eq('201')
		end
	end

	describe '#send_to with custom cred' do
		before {
			subject.configure do |config|
				config.app_id = ''
				config.app_secret = ''
				config.passphrase = ''
				config.short_code = ''
			end			
		}

		let(:message) { 'Hello world! FROM CUSTOM CONFIG' }
		let(:address) { '639778198061' }
		let(:custom_cred) {
			{
				app_id: '',
				app_secret: '',
				passphrase: '',
				short_code: ''
			}
		}
		let(:output) { 
			subject.send_message(address, message, custom_cred)
		}

		it 'should return TRUE' do
			expect(output[:http_code]).to eq('201')
		end
	end

end
