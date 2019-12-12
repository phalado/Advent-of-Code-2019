line_num = 0
data = File.open('day01-source').read
data.gsub!(/\r\n?/, "\n")

soma = 0
data.each_line do |x|
  x = x.to_i
  while x > 8 do
    y = (x / 3) - 2
    soma += y
    x = y
  end
  p soma
end

p soma
