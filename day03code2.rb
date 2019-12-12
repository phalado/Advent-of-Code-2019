class Node
  attr_accessor :nextbranch, :x0, :y0, :xf, :yf

  def initialize(x0, xf, y0, yf)
    @x0 = x0
    @xf = xf
    @y0 = y0
    @yf = yf
    nextbranch = nil;
  end
end

class SearchTree
  attr_accessor :root

  def initialize
    @root = Node.new(0, 0, 0, 0)
  end

  def newbranch(node, x0, xf, y0, yf)
    if node.nil? then
      return node = Node.new(x0, xf, y0, yf)
    elsif node.nextbranch.nil? then
      node.nextbranch = newbranch(node.nextbranch, x0, xf, y0, yf)
    else
      newbranch(node.nextbranch, x0, xf, y0, yf)
    end
  end

  def search(node, x, y)
    return false if node.nil?

    if x.between?(node.x0, node.xf) and y.between?(node.y0, node.yf)
      return true
    else
      search(node.nextbranch, x, y)
    end
  end

  def countsearch(node, x, y, steps)
    if x.between?(node.x0, node.xf) and y.between?(node.y0, node.yf)
      return steps + (x.abs - node.x0.abs) + (y.abs - node.y0.abs)
    else
      countsearch(node.nextbranch, x, y, steps + (node.xf - node.x0).abs + (node.yf - node.y0).abs)
    end
  end
end

class CodeZeroThreeTwo

  def initialize
    @tree = SearchTree.new
    @inter = []
    @x = 0
    @y = 0
    getdata
    firstwireway
  end

  def getdata
    data = File.open('day03-source').read
    # data = File.open('test').read
    data = data.split("\n")
    @wire1 = data[0].split(",")
    @wire2 = data[1].split(",")
  end

  def hwalking(direction, distance)
    if direction == "R" then
      @tree.newbranch(@tree.root, @x, @x + distance, @y, @y)
      @x += distance
    else
      @tree.newbranch(@tree.root, @x - distance, @x, @y, @y)
      @x -= distance
    end
  end

  def vwalking(direction, distance)
    if direction == "U" then
      @tree.newbranch(@tree.root, @x, @x, @y, @y + distance)
      @y += distance
    else
      @tree.newbranch(@tree.root, @x, @x, @y - distance, @y)
      @y -= distance
    end
  end

  def firstwireway
    @wire1.each do |i|
      if i[0] == "R" or i[0] == "L" then
        hwalking(i[0], i[1..-1].to_i)
      else
        vwalking(i[0], i[1..-1].to_i)
      end
    end
  end

  def secondwireway
    x2 = 0
    y2 = 0
    steps = 0
    @wire2.each do |i|
      case i[0]
      when "R"
        (0...i[1..-1].to_i).each do
          x2 += 1
          steps += 1
          @inter << steps + countsteps(x2, y2) if @tree.search(@tree.root, x2, y2)
        end
      when "L"
        (0...i[1..-1].to_i).each do
          x2 -= 1
          steps += 1
          @inter << steps + countsteps(x2, y2) if @tree.search(@tree.root, x2, y2)
        end
      when "U"
        (0...i[1..-1].to_i).each do
          y2 += 1
          steps += 1
          @inter << steps + countsteps(x2, y2) if @tree.search(@tree.root, x2, y2)
        end
      when "D"
        (0...i[1..-1].to_i).each do
          y2 -= 1
          steps += 1
          @inter << steps + countsteps(x2, y2) if @tree.search(@tree.root, x2, y2)
        end
      end
    end
    return @inter.min
  end

  def countsteps(x2, y2)
    x = 0
    y = 0
    steps = 0
    @wire1.each do |i|
      case i[0]
      when "R"
        (0...i[1..-1].to_i).each do
          x += 1
          steps += 1
          return steps if x == x2 and y == y2
        end
      when "L"
        (0...i[1..-1].to_i).each do
          x -= 1
          steps += 1
          return steps if x == x2 and y == y2
        end
      when "U"
        (0...i[1..-1].to_i).each do
          y += 1
          steps += 1
          return steps if x == x2 and y == y2
        end
      when "D"
        (0...i[1..-1].to_i).each do
          y -= 1
          steps += 1
          return steps if x == x2 and y == y2
        end
      end
    end
  end

end

n = CodeZeroThreeTwo.new
p n.secondwireway
