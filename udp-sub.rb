#!/usr/bin/env ruby

require './benchmark'
require 'socket'

udp = UDPSocket.new

udp.bind('localhost', $config.port)[0]

# get start
udp.recvfrom(1024)[0]

benchmark(:sub) do |expectedMessage|
  puts udp.recvfrom(1024)[0]
end
