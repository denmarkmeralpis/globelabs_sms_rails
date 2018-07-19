[![Build Status](https://travis-ci.org/denmarkmeralpis/globelabs_sms_rails.svg?branch=master)](https://travis-ci.org/denmarkmeralpis/globelabs_sms_rails) [![Test Coverage](https://api.codeclimate.com/v1/badges/8f4e8e1c883e6865d2ed/test_coverage)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_rails/test_coverage) [![Maintainability](https://api.codeclimate.com/v1/badges/8f4e8e1c883e6865d2ed/maintainability)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_rails/maintainability)

# Globe Labs SMS on Rails

This gem will help you send SMS using Globe Labs API. Please take note that this gem will work if the subscriber consent workflow is disabled. You can apply the process by asking Globe

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globelabs_sms_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install globelabs_sms_rails
    
Generate initializer to config/initializer via:

    $ rails g globelabs_sms_rails:install
    
then edit the file in `config/initializer/globelabs_sms_rails.rb` and supply the necessary details.

## Usage

Two way of sending SMS:
```ruby
# Direct sending through class method #send
GlobelabsSmsRails::Client.send(address: '0917XXXXXXX', message: 'Your message here!')
    
# Initialize and send
client = GlobelabsSmsRails::Client.new(address: '0917XXXXXXX', message: 'Your message here!)
ciient.send
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denmarkmeralpis/globelabs_sms_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the GlobelabsSmsRails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/denmarkmeralpis/globelabs_sms_rails/blob/master/CODE_OF_CONDUCT.md).
