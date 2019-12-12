class CodeZeroTwoTwo

  def getdata
    @data = File.open('day02-source').read
    @data = @data.split(',')
    @data.map! { |x| x.to_i }
  end

  def verify(i)
    case @data[i]
    when 1
      caseone(i)
      return false
    when 2
      casetwo(i)
      return false
    when 99
      return true
    else
      p "Something wrong is not right!!!"
      return true
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
    return @data[0]
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
while number.gamerun(a, b) != 19690720 do
  # p "a = #{a} - b = #{b}"
  if b < 100 then
    b += 1
  else
    a += 1
    b = 1
  end
end

p 100 * a + b
