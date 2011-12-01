#!/usr/bin/env ruby

require './benchmark'

ctx = ZMQ::Context.new(1)

socket = ctx.socket(ZMQ::SUB)

socket.connect("tcp://localhost:#{$config.port}")
#socket.connect("ipc://log")

socket.setsockopt(ZMQ::SUBSCRIBE, 'start')
socket.setsockopt(ZMQ::SUBSCRIBE, 'log')

# wait for start
msg = socket.recv()
puts msg

benchmark do |expectedMessage|
  msg = socket.recv()
  puts msg
end

socket.close
ctx.close
