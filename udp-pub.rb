#!/usr/bin/env ruby

require './benchmark'
require 'socket'

udp = UDPSocket.open

#udp.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)

udp.send("start", 0, "localhost", $config.port)

benchmark do |message|
  udp.send(message, 0, "localhost", $config.port)
end

sleep 1
udp.close

