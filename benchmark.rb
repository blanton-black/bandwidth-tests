require 'json'
require 'ostruct'
require 'bundler'
Bundler.require

$config = OpenStruct.new(JSON.parse(File.read('config.json')))

def benchmark
  t0 = Time.now
  $config.iterations.times do
    yield $config.message
  end
  t1 = Time.now
  totalTime = t1 - t0
  averageTime = totalTime/$config.iterations
  $stderr.puts "total: #{totalTime} s"
  $stderr.puts "avg: #{averageTime * 1000} ms"
  totalBytes = $config.message.size * $config.iterations
  totalMB = totalBytes / 1000000
  $stderr.puts "total: #{totalMB} MB"
  $stderr.puts "speed: #{totalMB/totalTime} MB/s"
end
