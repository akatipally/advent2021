require 'pry'
require 'pry-byebug'

input =
"0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2".split("\n")

ventMap = {}
input.each do |segment|
  positions = segment.split("->").map { |elem| elem.strip }
  pos1 = positions[0].split(",")
  pos2 = positions[1].split(",")
  x1 = pos1[0].to_i
  y1 = pos1[1].to_i
  x2 = pos2[0].to_i
  y2 = pos2[1].to_i

  if x1 == x2
    unless ventMap.key?(x1)
      ventMap[x1] = {}
    end

    if y1 < y2
      start = y1
      final = y2
    else
      start = y2
      final = y1
    end

    (start..final).each do |curr|
      unless ventMap[x1].key?(curr)
        ventMap[x1][curr] = 0
      end

      ventMap[x1][curr] += 1
    end

  elsif y1 == y2
    if x1 < x2
      start = x1
      final = x2
    else
      start = x2
      final = x1
    end

    (start..final).each do |curr|
      unless ventMap.key?(curr)
        ventMap[curr] = {}
      end

      unless ventMap[curr].key?(y1)
        ventMap[curr][y1] = 0
      end

      ventMap[curr][y1] += 1
    end

  else
    if x1 < x2
      startx = x1
      finalx = x2
    else
      startx = x2
      finalx = x1
    end

    if y1 < y2
      starty = y1
      finaly = y2
    else
      starty = y2
      finaly = y1
    end

    if finalx - startx == finaly - starty
      diagonalDistance = finalx - startx + 1
      if x1 < x2
        xfactor = 1
      else
        xfactor = -1
      end

      if y1 < y2
        yfactor = 1
      else
        yfactor = -1
      end

      diagonalDistance.times do |i|
        unless ventMap.key?(x1 + (i * xfactor))
          ventMap[x1 + (i * xfactor)] = {}
        end

        unless ventMap[x1 + (i * xfactor)].key?(y1 + (i * yfactor))
          ventMap[x1 + (i * xfactor)][y1 + (i * yfactor)] = 0
        end

        ventMap[x1 + (i * xfactor)][y1 + (i * yfactor)] += 1
      end
    end
  end
end

pointsMoreThan2 = 0
ventMap.each do |x, ys|
  ys.each do |y, ventValue|
    if ventValue > 1
      pointsMoreThan2 += 1
    end
  end
end

puts pointsMoreThan2

