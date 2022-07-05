[![Gem Version](https://badge.fury.io/rb/btc_turk.svg)](https://badge.fury.io/rb/btc_turk)
![test](https://github.com/nejdetkadir/btc-turk/actions/workflows/test.yml/badge.svg?branch=main)
![rubocop](https://github.com/nejdetkadir/btc-turk/actions/workflows/rubocop.yml/badge.svg?branch=main)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby_version->=_2.7.0-blue.svg)

# BtcTurk
Ruby wrapper for [BtcTurk API](https://docs.btcturk.com/)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'btc_turk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install btc_turk

## Configuration
```ruby
BtcTurk.configure do |config|
  config.logger = ::Logger.new($stdout).tap { |d| d.level = Logger::DEBUG }
  config.raw_response = false
end

BtcTurk.config.raw_response = true
BtcTurk.config.logger = ::Logger.new($stdout).tap { |d| d.level = Logger::DEBUG }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nejdetkadir/btc-turk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nejdetkadir/btc-turk/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BtcTurk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nejdetkadir/btc-turk/blob/main/CODE_OF_CONDUCT.md).
