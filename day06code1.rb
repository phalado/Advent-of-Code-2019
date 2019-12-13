class Node
  attr_accessor :nextbranch, :center, :orbit, :norbit

  def initialize(center, orbit, norbit)
    @center = center
    @orbit = orbit
    @norbit = norbit
    nextbranch = nil
  end
end

class CodeZeroSixOne
  def initialize
    @root = Node.new('None', 'COM', 0)
    getdata
    gamerun('COM', 0)
    p printbranch(@root, 0)
  end

  def newbranch(node, center, orbit, norbit)
    # p node
    if node.nil?
      node = Node.new(center, orbit, norbit)
    elsif node.nextbranch.nil?
      node.nextbranch = newbranch(node.nextbranch, center, orbit, norbit)
    else
      newbranch(node.nextbranch, center, orbit, norbit)
    end
  end

  def printbranch(node, total)
    # p "#{node.center} #{node.orbit} #{node.norbit}"
    total += node.norbit
    total = printbranch(node.nextbranch, total) unless node.nextbranch.nil?
    total
  end

  def getdata
    @data = File.open('day06-source').read
    # @data = File.open('test').read
    @data = @data.split("\n")
    @data.sort!
    (0...@data.length).each do |i|
      @data[i] = @data[i].split(')')
    end
  end

  def datasearch(x)
    sch = []
    i = 0
    while i < @data.length
      if @data[i][0] == x
        sch << @data[i][1]
        @data.delete_at(i)
      else
        i += 1
      end
    end
    sch
  end

  def gamerun(center, orbits)
    while @data != []
      arr = datasearch(center)
      if arr == []
        return
      else
        arr.each do |i|
          newbranch(@root, center, i, orbits + 1)
          gamerun(i, orbits + 1)
        end
      end
    end
  end
end

n = CodeZeroSixOne.new
