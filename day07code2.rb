class CodeZeroSevenTwo
  attr_accessor :output, :input, :data, :ind, :goback

  def initialize(input, datafile)
    @goback = false
    @input = input
    @output = 0
    @ind = 1
    getdata(datafile)
    # gamerun
    # p @output
    # return @output[-1]
  end

  def getdata(datafile)
    @data = []
    @data[1] = File.open(datafile).read
    # @data = File.open('test').read
    @data[1] = @data[1].split(',')
    @data[1].map!(&:to_i)

    @data[2] = File.open(datafile).read
    # @data = File.open('test').read
    @data[2] = @data[2].split(',')
    @data[2].map!(&:to_i)

    @data[3] = File.open(datafile).read
    # @data = File.open('test').read
    @data[3] = @data[3].split(',')
    @data[3].map!(&:to_i)

    @data[4] = File.open(datafile).read
    # @data = File.open('test').read
    @data[4] = @data[4].split(',')
    @data[4].map!(&:to_i)

    @data[5] = File.open(datafile).read
    # @data = File.open('test').read
    @data[5] = @data[5].split(',')
    @data[5].map!(&:to_i)

    # p "DATA1 #{@data[1]}"
    # p "DATA2 #{@data[2]}"
    # p "DATA3 #{@data[3]}"
    # p "DATA4 #{@data[4]}"
    # p "DATA5 #{@data[5]}"
  end

  def verify(i)
    # p "#{i} #{@data[i]} #{@data}"
    case @data[@ind][i]
    when 1
      caseone(i)
      i + 4
    when 2
      casetwo(i)
      i + 4
    when 3
      casethree(i)
      i + 2
    when 4
      casefour(i)
      i + 2
    when 5
      casefive(i)
    when 6
      casesix(i)
    when 7
      caseseven(i)
      i + 4
    when 8
      caseeight(i)
      i + 4
    else
      parametermode(i)
    end
  end

  def caseone(i)
    @data[@ind][@data[@ind][i + 3].to_i] = @data[@ind][@data[@ind][i + 1].to_i].to_i +
                                           @data[@ind][@data[@ind][i + 2].to_i].to_i
  end

  def casetwo(i)
    @data[@ind][@data[@ind][i + 3].to_i] = @data[@ind][@data[@ind][i + 1].to_i].to_i *
                                           @data[@ind][@data[@ind][i + 2].to_i].to_i
  end

  def casethree(i)
    @data[@ind][@data[@ind][i + 1]] = @input[0]
    @input.shift
  end

  def casefour(i)
    @output = @data[@ind][@data[@ind][i + 1]]
    @goback = true
  end

  def casefive(i)
    @data[@ind][@data[@ind][i + 1]] != 0 ? @data[@ind][@data[@ind][i + 2]] : i + 3
  end

  def casesix(i)
    @data[@ind][@data[@ind][i + 1]] == 0 ? @data[@ind][@data[@ind][i + 2]] : i + 3
  end

  def caseseven(i)
    @data[@ind][@data[@ind][i + 3]] = if @data[@ind][@data[@ind][i + 1]] < @data[@ind][@data[@ind][i + 2]]
                                        1
                                      else
                                        0
                                      end
  end

  def caseeight(i)
    @data[@ind][@data[@ind][i + 3]] = if @data[@ind][@data[@ind][i + 1]] == @data[@ind][@data[@ind][i + 2]]
                                        1
                                      else
                                        0
                                      end
  end

  def parametermode(i)
    data = @data[@ind][i].to_s.split('')
    op = data[-1]
    a = if data[-3] == '0'
          @data[@ind][@data[@ind][i + 1]]
        else
          @data[@ind][i + 1]
        end
    b = if data.length == 4
          if data[-4] == '0'
            @data[@ind][@data[@ind][i + 2]]
          else
            @data[@ind][i + 2]
              end
        else
          @data[@ind][@data[@ind][i + 2]]
        end
    if op == '1'
      @data[@ind][@data[@ind][i + 3]] = a + b
      return i + 4
    elsif op == '2'
      @data[@ind][@data[@ind][i + 3]] = a * b
      return i + 4
    elsif op == '3'
      @data[@ind][i + 1] = @input[0]
      @input.shift
      return i + 2
    elsif op == '4'
      @output = @data[@ind][i + 1]
      @goback = true
      return i + 2
    elsif op == '5'
      return a != 0 ? b : i + 3
    elsif op == '6'
      return a == 0 ? b : i + 3
    elsif op == '7'
      @data[@ind][@data[@ind][i + 3]] = if a < b
                                          1
                                        else
                                          0
                                        end
      return i + 4
    elsif op == '8'
      @data[@ind][@data[@ind][i + 3]] = if a == b
                                          1
                                        else
                                          0
                                        end
      return i + 4
    end
  end

  # def gamerun
  #   i = 0
  #   while @data[i] != 99 and @output == []
  #     i = verify(i)
  #   end
  # end
end

# arr = [9, 0, 8, 7, 6, 5]
# arr = [9, 0, 7, 8, 5, 6]
result = []

[5, 6, 7, 8, 9].permutation.to_a.each do |arr|
  arr.insert(1, 0)
  n = CodeZeroSevenTwo.new(arr, 'day07-source')
  i = [0, 0, 0, 0, 0, 0]
  while n.data[n.ind][i[n.ind]] != 99
    # p "ind=#{n.ind} i=#{i[n.ind]} data[i]=#{n.data[n.ind][i[n.ind]]} arr=#{arr} out=#{n.output}"
    i[n.ind] = n.verify(i[n.ind])
    next unless n.goback == true

    n.ind = n.ind == 5 ? 1 : n.ind + 1
    if arr == []
      arr.insert(0, n.output)
    else
      arr.insert(1, n.output)
    end
    n.goback = false
  end
  result << n.output
end
# p "ind=#{n.ind} i=#{i[n.ind]} data[i]=#{n.data[n.ind][i[n.ind]]} arr=#{arr} out=#{n.output}"
# p n.data
# p arr
p result.max
