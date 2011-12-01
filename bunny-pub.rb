#!/usr/bin/env ruby

require './benchmark'

b = Bunny.new
b.start
exch = b.exchange('log')

benchmark do |message|
  exch.publish(message)
end
