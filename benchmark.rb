require 'json'
require 'ostruct'
require 'bundler'
Bundler.require

$config = OpenStruct.new(JSON.parse(File.read('config.json')))

if $config.message[0] == ?@
  $config.message = File.read($config.message[1..-1])
end

def benchmark(mode)
  t0 = Time.now
  $config.iterations.times do
    yield $config.message
  end
  t1 = Time.now
  return if mode == :sub
  totalTime = t1 - t0
  averageTime = totalTime/$config.iterations
  #$stderr.puts "total: #{totalTime} s"
  #$stderr.puts "avg: #{averageTime * 1000} ms"
  totalBytes = $config.message.size.to_f * $config.iterations
  totalMB = totalBytes / 1000000
  $stderr.puts "total data: #{totalMB} MB"
  $stderr.puts "avg speed: #{totalMB/totalTime} MB/s"
end
