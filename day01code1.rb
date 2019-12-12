line_num = 0
data = File.open('day01-source').read
data.gsub!(/\r\n?/, "\n")

soma = 0
data.each_line do |x|
  soma += (x.to_i / 3) - 2
end

p soma