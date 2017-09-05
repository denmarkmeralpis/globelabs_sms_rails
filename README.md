# GlobelabsSmsRails

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/globelabs_sms_rails`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globelabs_sms_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install globelabs_sms_rails

After install the gem, generate an initializer and configure it
		
	$ rails g globelabs_sms_rails:install 


## Usage
```ruby
sms = GlobelabsSmsRails.compose("Your message")
sms.send_to("63917XXXXXXX")
```

Sample response:
```json
{
    "outboundSMSMessageRequest": {
        "address": "639082910073",
        "deliveryInfoList": {
            "deliveryInfo": [],
            "resourceURL": "https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9718/requests?app_id=MepqHjGraoIx5iqx8ycrkKIX9eK5HE9E&app_secret=56f000d1fea81e6fa5a36085b2e0179d30b38396fe6b4f9f1690ba865a3f41ba&message=This%20is%20a%20test%20message%20again&passphrase=5sbOSOt2bS&address=639082910073"
        },
        "senderAddress": "9718",
        "outboundSMSTextMessage": {
            "message": "This is a test message again"
        },
        "receiptRequest": {
            "notifyURL": "http://9809f847.ap.ngrok.io/api/sms/callback",
            "callbackData": null,
            "senderName": null
        },
        "resourceURL": "https://devapi.globelabs.com.ph/smsmessaging/v1/outbound/9718/requests?app_id=MepqHjGraoIx5iqx8ycrkKIX9eK5HE9E&app_secret=56f000d1fea81e6fa5a36085b2e0179d30b38396fe6b4f9f1690ba865a3f41ba&message=This%20is%20a%20test%20message%20again&passphrase=5sbOSOt2bS&address=639082910073",
        "numberOfMessagesInThisBatch": 1
    },
    "http_code": "201"
}
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).