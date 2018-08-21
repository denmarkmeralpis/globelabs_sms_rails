[![Build Status](https://travis-ci.org/denmarkmeralpis/globelabs_sms_rails.svg?branch=master)](https://travis-ci.org/denmarkmeralpis/globelabs_sms_rails) [![Test Coverage](https://api.codeclimate.com/v1/badges/8f4e8e1c883e6865d2ed/test_coverage)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_rails/test_coverage) [![Maintainability](https://api.codeclimate.com/v1/badges/8f4e8e1c883e6865d2ed/maintainability)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_rails/maintainability) [![Gem Version](https://badge.fury.io/rb/globelabs_sms_rails.svg)](https://badge.fury.io/rb/globelabs_sms_rails)

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

    $ rails g globelabs_sms_rails:install initializer
    
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

# License

MIT License

Copyright (c) 2017 Nujian Den Mark Meralpis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denmarkmeralpis/globelabs_sms_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the GlobelabsSmsRails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/denmarkmeralpis/globelabs_sms_rails/blob/master/CODE_OF_CONDUCT.md).

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=nujiandenmarkmeralpis@gmail.com&lc=US&item_name=For+Living&no_note=0&cn=&curency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted)
