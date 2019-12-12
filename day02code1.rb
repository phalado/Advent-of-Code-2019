data = File.open('day02-source').read
data = data.split(',')

data[1] = 12
data[2] = 2

i = 0
while data[i].to_i != 99 do
  if data[i].to_i == 1 then
    data[data[i + 3].to_i] = data[data[i + 1].to_i].to_i + data[data[i + 2].to_i].to_i
  elsif data[i].to_i == 2 then
    data[data[i + 3].to_i] = data[data[i + 1].to_i].to_i * data[data[i + 2].to_i].to_i
  else p "Something wrong is not right!!!"
  end
  i += 4
end

p data[0]