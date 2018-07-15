def getWays(n, c)
  if n == 0
    return 1
  elsif n < 0
    return 0
  elsif c.count == 0
    return 0
  else
    return getWays(n - c[0], c) + getWays(n, c[1..-1])
  end
end

def getWaysMemoized(n, c)
  answers = Array.new(n + 1) { Array.new(c.length) }
  answers[0].each_with_index do |answer, i|
    answers[0][i] = 1
  end

  (1..n).each do |val|
    (0..(c.length - 1)).each do |c_num|
      puts "#{val}, #{c_num}"
      if val - c[c_num] >= 0
        num_ways_with = answers[val - c[c_num]][c_num]
      else
        num_ways_with = 0
      end

      if c_num >= 1
        num_ways_without = answers[val][c_num - 1]
      else
        num_ways_without = 0
      end

      answers[val][c_num] = num_ways_with + num_ways_without
    end
  end

  return answers.last.last
end


puts getWaysMemoized(10, [2, 5, 3, 6])
