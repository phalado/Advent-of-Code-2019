require './day05code1.rb'

result = []
source = 'day07-source'
# source = 'test'

[0 ,1, 2, 3, 4].permutation.to_a.each do |arr|
  arr.insert(1, 0)
  run = CodeZeroFiveOne.new(arr, source)
  arr = run.input
  arr.insert(1, run.output[0])
  run = CodeZeroFiveOne.new(arr, source)
  arr = run.input
  arr.insert(1, run.output[0])
  run = CodeZeroFiveOne.new(arr, source)
  arr = run.input
  arr.insert(1, run.output[0])
  run = CodeZeroFiveOne.new(arr, source)
  arr = run.input
  arr.insert(1, run.output[0])
  run = CodeZeroFiveOne.new(arr, source)
  result << run.output[0]
end
# p run.input
p result.max
