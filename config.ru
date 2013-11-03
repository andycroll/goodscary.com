require 'rubygems'
require 'bundler/setup'

require 'rack-rewrite'

DOMAIN = 'goodscary.com'
use Rack::Rewrite do
  r301 %r{.*}, "http://#{DOMAIN}$&", :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != DOMAIN && ENV['RACK_ENV'] == 'production'
  }
end

$stdout.sync = true

require './app'
run App
