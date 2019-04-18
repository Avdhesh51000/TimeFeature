require "TimeFeature/version"
require "TimeFeature/time_extra_method"
require "TimeFeature/integer_extra_method"

# module TimeFeature
# class Error < StandardError; end
# Your code goes here...
class Time
  include TimeFeature
end
class Integer
  include TimeFeature
  # end
end
