#!/usr/bin/env ruby
require 'optparse'
require './api'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: ruby ruguofan.rb COMMAND [OPTION]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     read: read home timeline"
  opt.separator  "     post: post a new message"
  opt.separator  ""
  opt.separator  "Options"

  opt.on("-m","--message MESSAGE","message to be posted") do |message|
    options[:message] = message
  end

end

opt_parser.parse!

api = API.new

case ARGV[0]
when "read"
  api.home_timeline ARGV[1]
when "post"
  api.post options[:message]
else
  puts opt_parser
end
