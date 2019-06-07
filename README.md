# Effe

## Problem

Domain actions usually have side effects such as sending email, sending ticket to some arbitrary help desk system or track analytics event. Or even some other domain action. Usually you have some set of actions which can be transactional, can call other actions and naively managing effects can become very tedious and unreliable (ever stumbled upon prematurely fired effect?).

## Solution

Besides event based solutions, which requires much more technical setup, there are simplier ways to have control over domain action effects and Effe aims to be one of those.

Basically, Effe is just a type for accumulating effects, and nothing more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'effe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install effe

## Usage

Sample usage vision.

```
class A
  include Effe::Effectful.for(:call)

  register_effects [:callback]
  
  def call
    val
  end
  
  private 
  
  def callback
    # some arbitrary code...
  end
end

class B
  include Effe::Effectful
  
  def call
    Effectful(val, [:callback])
  end
  
  private 
  
  def callback
    # some arbitrary code...
  end
end

first = A.new
second = B.new
third = -> { Effectful(some_val, []) }

first.call.bind { || second.call }.bind { || third.call }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### TODO list

- [ ] add specs
- [ ] add error handling with sane error messages
- [ ] implement method for calling callbacks
- [ ] improve api

### Problems for future

- callbacks should be run in other thread
- now you have access only to the result of previous binding

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Qlean/effe. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Effe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Qlean/effe/blob/master/CODE_OF_CONDUCT.md).
