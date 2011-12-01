#!/usr/bin/env ruby

require './benchmark'
require 'socket'

tcp = TCPSocket.new('localhost', $config.port)

benchmark(:pub) do |message|
  tcp.write(message)
end

tcp.close
