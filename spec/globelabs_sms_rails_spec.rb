require 'spec_helper'

describe GlobelabsSmsRails do
	subject { GlobelabsSmsRails }

	describe '#send_to' do
		before {
			subject.configure do |config|
				config.app_id = '[app_id]'
				config.app_secret = '[app_secret]'
				config.passphrase = '[passphrase]'
				config.short_code = '[code]'
			end
		}
		let(:message) { 'Hello world!' }
		let(:address) { '639778198061' }
		let(:output) { 
			subject.send_message(address, message)
		}

		it 'should return TRUE' do
			expect(output[:http_code]).to eq('201')
		end
	end

end
