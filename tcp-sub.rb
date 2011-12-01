#!/usr/bin/env ruby

require './benchmark'
require 'socket'

server = TCPServer.new($config.port)

client = server.accept

benchmark do |expectedMessage|
  msg = client.readline
  puts msg
end
