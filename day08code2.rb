require 'colorize'

def check(data, i)
  if data[i] != "2"
    return data[i]
  else
    check(data, i + 150)
  end
end

source = 'day08-source'
# source = 'test'

data = File.open(source).read
data = data.chars
result0 = []
result1 = []
result2 = []
result3 = []
result4 = []
result5 = []
result6 = []

(0...6).each do |x|
  (0...25).each do |y|
    i = (x * 25) + y
    result0 << check(data, i)
  end
end

# i = 2
# while i < data.length
#   print data[i]
#   i += 150
# end

# p result0
# p result0.length

result1 = result0[0, 25]
result2 = result0[25, 25]
result3 = result0[50, 25]
result4 = result0[75, 25]
result5 = result0[100, 25]
result6 = result0[125, 25]

# print " ".colorize(background: :white)
# puts " ".colorize(background: :white)


result1.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
puts
result2.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
puts
result3.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
puts
result4.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
puts
result5.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
puts
result6.to_s.each_char do |x|
  if x == "0"
    print " ".colorize(background: :red)
  elsif x == "1"
    print " ".colorize(background: :white)
  end
end
# puts result1.join
# puts result2.join
# puts result3.join
# puts result4.join
