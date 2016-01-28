# Net::SSH::Stream

[![Gem Version](https://badge.fury.io/rb/net-ssh-stream.png)](https://rubygems.org/gems/net-ssh-stream)
[![Build Status](https://travis-ci.org/gabynaiman/net-ssh-stream.png?branch=master)](https://travis-ci.org/gabynaiman/net-ssh-stream)
[![Coverage Status](https://coveralls.io/repos/gabynaiman/net-ssh-stream/badge.png?branch=master)](https://coveralls.io/r/gabynaiman/net-ssh-stream?branch=master)
[![Code Climate](https://codeclimate.com/github/gabynaiman/net-ssh-stream.png)](https://codeclimate.com/github/gabynaiman/net-ssh-stream)
[![Dependency Status](https://gemnasium.com/gabynaiman/net-ssh-stream.png)](https://gemnasium.com/gabynaiman/net-ssh-stream)

Net::SSH extension for streaming stdout and stderr from remote commnad

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'net-ssh-stream'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install net-ssh-stream

## Usage

```ruby
require 'net/ssh/stream'

stdout = StringIO.new
stderr = StringIO.new

stream = Net::SSH::Stream.new 'host', 'user', password: 'password'

stream.exec 'ls', stdout: stdout, stderr: stderr

stream.close

# OR

Net::SSH::Stream.start('host', 'user', password: 'password') do |stream|
  stream.exec 'ls', stdout: stdout, stderr: stderr
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gabynaiman/net-ssh-stream.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

