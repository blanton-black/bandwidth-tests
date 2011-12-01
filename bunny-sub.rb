#!/usr/bin/env ruby

require './benchmark'
require 'bunny'

b = Bunny.new
b.start
q = b.queue('log')

if true
  puts "press enter once publisher is ready..."
  gets
  benchmark(:sub) do |expectedMessage|
    msg = q.pop[:payload]
    puts msg
  end
else
  exch = b.exchange('log')
  q.bind(exch)
  puts 'kill when ready...'
  q.subscribe do |message|
    puts message[:payload]
  end
end


b.stop
