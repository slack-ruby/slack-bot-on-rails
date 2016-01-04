$:.unshift File.dirname(__FILE__)
require 'bot'

Thread.abort_on_exception = true

Thread.new do
  Bot.run
end
