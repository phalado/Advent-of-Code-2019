class CodeZeroFourOne

  def initialize
    @count = 0
    getdata
  end

  def getdata
    data = File.open('day04-source').read
    data = data.split("\n")
    @limit0 = data[0].to_i
    @limitf = data[1].to_i
  end

  def double
    s = @limit0.to_s.split("")
    for i in (1...s.length)
      return true if s[i] == s[i - 1]
    end
    false
  end

  def increase
    s = @limit0.to_s.split("")
    for i in (1...s.length)
      return false if s[i] < s[i - 1]
    end
    true
  end

  def verify
    while @limit0 <= @limitf
      @count += 1 if double and increase
      @limit0 += 1
    end
    return @count
  end

end

n = CodeZeroFourOne.new
p n.verify
