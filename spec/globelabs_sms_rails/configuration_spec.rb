require_relative '../spec_helper'
require 'dotenv'

Dotenv.load

RSpec.describe GlobelabsSmsRails::Configuration do   
	before do
		GlobelabsSmsRails.configure do |config|
			config.app_id = ENV['GLABS_APP_ID']
			config.app_secret = ENV['GLABS_APP_SECRET']
			config.passphrase = ENV['GLABS_PASSPHRASE']
			config.short_code = ENV['GLABS_SHORT_CODE']
		end
	end

	context 'with configuration block' do
		it 'returns the correct app_id' do
			expect(GlobelabsSmsRails.configuration.app_id).to eq(ENV['GLABS_APP_ID'])
		end

		it 'returns the correct app_secret' do
			expect(GlobelabsSmsRails.configuration.app_secret).to eq(ENV['GLABS_APP_SECRET'])
		end

		it 'returns the correct passphrase' do
			expect(GlobelabsSmsRails.configuration.passphrase).to eq(ENV['GLABS_PASSPHRASE'])
		end

		it 'returns the correct short_code' do
			expect(GlobelabsSmsRails.configuration.short_code).to eq(ENV['GLABS_SHORT_CODE'])
		end
	end

	context 'without configuration block' do
		before do
			GlobelabsSmsRails.reset
		end

		it 'raises a configuration error for app_id' do
			expect { GlobelabsSmsRails.configuration.app_id }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
		end

		it 'raises a configuration error for app_secret' do
			expect { GlobelabsSmsRails.configuration.app_secret }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
		end

		it 'raises a configuration error for passphrase' do
			expect { GlobelabsSmsRails.configuration.passphrase }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
		end

		it 'raises a configuration error for short_code' do
			expect { GlobelabsSmsRails.configuration.short_code }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
		end
	end

	context '#reset' do
		it 'resets configured values' do
			expect(GlobelabsSmsRails.configuration.app_id).to eq(ENV['GLABS_APP_ID'])
			expect(GlobelabsSmsRails.configuration.app_secret).to eq(ENV['GLABS_APP_SECRET'])
			expect(GlobelabsSmsRails.configuration.passphrase).to eq(ENV['GLABS_PASSPHRASE'])
			expect(GlobelabsSmsRails.configuration.short_code).to eq(ENV['GLABS_SHORT_CODE'])

			GlobelabsSmsRails.reset			
			expect { GlobelabsSmsRails.configuration.app_id }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
			expect { GlobelabsSmsRails.configuration.app_secret }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
			expect { GlobelabsSmsRails.configuration.passphrase }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
			expect { GlobelabsSmsRails.configuration.short_code }.to raise_error(GlobelabsSmsRails::Errors::Configuration)
		end
	end
end