class CodeZeroTwoTwo
  def getdata
    @data = File.open('day02-source').read
    @data = @data.split(',')
    @data.map!(&:to_i)
  end

  def verify(i)
    case @data[i]
    when 1
      caseone(i)
      false
    when 2
      casetwo(i)
      false
    when 99
      true
    else
      p 'Something wrong is not right!!!'
      true
    end
  end

  def gamerun(a, b)
    getdata
    enterinput(a, b)
    endgame = false
    i = 0
    while endgame == false
      endgame = verify(i)
      i += 4
    end
    @data[0]
  end

  def caseone(i)
    @data[@data[i + 3].to_i] = @data[@data[i + 1].to_i].to_i + @data[@data[i + 2].to_i].to_i
  end

  def casetwo(i)
    @data[@data[i + 3].to_i] = @data[@data[i + 1].to_i].to_i * @data[@data[i + 2].to_i].to_i
  end

  def enterinput(a, b)
    @data[1] = a
    @data[2] = b
  end
end

a = 1
b = 1

number = CodeZeroTwoTwo.new
while number.gamerun(a, b) != 19_690_720
  # p "a = #{a} - b = #{b}"
  if b < 100
    b += 1
  else
    a += 1
    b = 1
  end
end

p 100 * a + b
