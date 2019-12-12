class CodeZeroFiveTwo
  attr_accessor :output, :input

  def initialize(input, datafile)
    @input = input
    @output = []
    getdata(datafile)
    gamerun
    # p @output
    # return @output[-1]
  end

  def getdata(datafile)
    @data = File.open(datafile).read
    # @data = File.open('test').read
    @data = @data.split(',')
    @data.map! { |x| x.to_i }
  end

  def verify(i)
    # p "#{i} #{@data[i]} #{@data}"
    case @data[i]
    when 1
      caseone(i)
      return i + 4
    when 2
      casetwo(i)
      return i + 4
    when 3
      casethree(i)
      return i + 2
    when 4
      casefour(i)
      return i + 2
    when 5
      return casefive(i)
    when 6
      return casesix(i)
    when 7
      caseseven(i)
      return i + 4
    when 8
      caseeight(i)
      return i + 4
    else
      return parametermode(i)
    end
  end

  def caseone(i)
    @data[@data[i + 3].to_i] = @data[@data[i + 1].to_i].to_i + @data[@data[i + 2].to_i].to_i
  end

  def casetwo(i)
    @data[@data[i + 3].to_i] = @data[@data[i + 1].to_i].to_i * @data[@data[i + 2].to_i].to_i
  end

  def casethree(i)
    @data[@data[i + 1]] = @input[0]
    if @input.length > 1
      @input.shift
    end
  end

  def casefour(i)
    @output << @data[@data[i + 1]]
  end

  def casefive(i)
    return @data[@data[i + 1]] != 0 ? @data[@data[i + 2]] : i + 3
  end

  def casesix(i)
    return @data[@data[i + 1]] == 0 ? @data[@data[i + 2]] : i + 3
  end

  def caseseven(i)
    if @data[@data[i + 1]] < @data[@data[i + 2]]
      @data[@data[i + 3]] = 1
    else
      @data[@data[i + 3]] = 0
    end
  end

  def caseeight(i)
    if @data[@data[i + 1]] == @data[@data[i + 2]]
      @data[@data[i + 3]] = 1
    else
      @data[@data[i + 3]] = 0
    end
  end

  def parametermode(i)
    data = @data[i].to_s.split("")
    op = data[-1]
    if data[-3] == "0"
      a = @data[@data[i + 1]]
    else
      a = @data[i + 1]
    end
    if data.length == 4
      if data[-4] == "0"
        b = @data[@data[i + 2]]
      else
        b = @data[i + 2]
      end
    else
      b = @data[@data[i + 2]]
    end
    if op == "1"
      @data[@data[i + 3]] = a + b
      return i + 4
    elsif op == "2"
      @data[@data[i + 3]] = a * b
      return i + 4
    elsif op == "3"
      @data[i + 1] = @input[0]
      if @input.length > 1
        @input.shift
      end
      return i + 2
    elsif op == "4"
      @output << @data[i + 1]
      return i + 2
    elsif op == "5"
      return a != 0 ? b : i + 3
    elsif op == "6"
      return a == 0 ? b : i + 3
    elsif op == "7"
      if a < b
        @data[@data[i + 3]] = 1
      else
        @data[@data[i + 3]] = 0
      end
      return i + 4
    elsif op == "8"
      if a == b
        @data[@data[i + 3]] = 1
      else
        @data[@data[i + 3]] = 0
      end
      return i + 4
    end
  end

  def gamerun
    i = 0
    while @data[i] != 99
      i = verify(i)
    end
  end
end

# n = CodeZeroFiveTwo.new([5], 'day05-source')
# p n.output[0]
