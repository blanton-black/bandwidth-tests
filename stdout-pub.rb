#!/usr/bin/env ruby

require './benchmark'

benchmark(:pub) do |message|
  puts message
end
