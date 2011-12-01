#!/usr/bin/env ruby

require './benchmark'

ctx = ZMQ::Context.new(1)

socket = ctx.socket(ZMQ::PUB)

socket.bind("tcp://*:#{$config.port}")
#socket.bind("ipc://log")

puts 'press enter after subscribers are ready...'
gets

socket.send("start")

benchmark do |message|
  socket.send("log " + message)
end

socket.close
ctx.close
