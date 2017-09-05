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

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
