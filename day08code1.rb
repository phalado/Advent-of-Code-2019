source = 'day08-source'
# source = 'test'

data = File.open(source).read
data = data.chars
result = []

i = 0
zeros = 0
ones = 0
twos = 0
while data != []
  zeros += 1 if data[0] == "0"
  ones += 1 if data[0] == "1"
  twos += 1 if data[0] == "2"
  data.shift
  i += 1
  if i == 150
    result << [zeros, ones, twos]
    i = 0
    zeros = 0
    ones = 0
    twos = 0
  end
end

# p result
zero = 2000
ind = 0
(0...100).each do |j|
  if result[j][0] < zero
    zero = result[j][0]
    ind = j
  end
end

p result[ind][1] * result[ind][2]