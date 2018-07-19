GlobelabsSmsRails.configure do |config|
   config.app_id     = ENV['GLABS_APP_ID']
   config.app_secret = ENV['GLABS_APP_SECRET']
   config.passphrase = ENV['GLABS_PASSPHRASE']
   config.short_code = ENV['GLABS_SHORT_CODE']
end