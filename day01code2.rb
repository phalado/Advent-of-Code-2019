data = File.open('day01-source').read

soma = 0
data.each_line do |x|
  x = x.to_i
  while x > 8
    x = (x / 3) - 2
    soma += x
  end
end

p soma
