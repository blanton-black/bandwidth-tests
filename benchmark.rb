require 'json'
require 'ostruct'

$config = OpenStruct.new(eval(File.read('config.json')))

def benchmark
  t0 = Time.now
  $config.iterations.times do
    yield $config.message
  end
  t1 = Time.now
  totalTime = t1 - t0
  averageTime = totalTime/$config.iterations
  puts "total: #{totalTime} s"
  puts "avg: #{averageTime * 1000} ms"
end
