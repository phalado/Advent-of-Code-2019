class CodeZeroFiveOne
  attr_accessor :output, :input

  def initialize(input, datafile)
    @input = input
    @output = []
    getdata(datafile)
    gamerun
    # p @output
  end

  def getdata(datafile)
    @data = File.open(datafile).read
    # @data = File.open('test').read
    @data = @data.split(',')
    @data.map! { |x| x.to_i }
  end

  def verify(i)
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
    end
  end

  def gamerun
    i = 0
    while @data[i] != 99
      i = verify(i)
    end
  end
end

n = CodeZeroFiveOne.new([1], 'day05-source')
p n.output[-1]
