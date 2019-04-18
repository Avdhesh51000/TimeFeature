# TimeFeature

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/TimeFeature`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'TimeFeature'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install TimeFeature

## Usage
Require this to initializers
require 'TimeFeature'

Use Like

Time.now
 => 2019-04-18 19:36:31 +0530

Time.now.to_second
 => 70591

Time.now.to_second.to_time
 => "19:36:31" 

 DateTime.parse(Time.now.to_second.to_time)
 => Thu, 18 Apr 2019 19:36:31 +0000


 In Rails DB 

 class Timeslot
  attr_accessor :start_t,:end_t
  include Mongoid::Document

  field :start, type: Integer,default: 0
  field :end, type: Integer,default: 0

  include Mongoid::Timestamps
  validates :start,:end,presence: true , numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 86399,  only_integer: true }
  before_validation :get_data

  scope :active_timeslot, -> { where(:$and => [{:start.lte => Time.now.to_second, :end.gte=> Time.now.to_second}]) }

  after_find -> {
    self.start_t = DateTime.parse(self.start.to_time)&.strftime("%R")
    self.end_t = DateTime.parse(self.end.to_time)&.strftime("%R")
  }
  after_initialize-> {
    self.start_t = Time.now.beginning_of_day.localtime&.strftime("%R") unless self.start_t.present?
    self.end_t = Time.now.end_of_day.localtime&.strftime("%R") unless self.end_t.present?
  }
  def get_data
    self.start = self.start_t.to_time.to_second if self.start_t
    self.end =  self.end_t.to_time.to_second if self.end_t
  end
end
 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/TimeFeature. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TimeFeature project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/TimeFeature/blob/master/CODE_OF_CONDUCT.md).
