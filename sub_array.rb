def maxSubArray(arr)
  sums = Array.new(arr.length + 1)
  sums[0] = 0

  for i in (1..arr.length)
      sums[i] = sums[i - 1] + arr[i - 1]
  end

  puts "SUMS: " + sums.inspect

  mins = Array.new(arr.length + 1)
  mins[0] = 0

  for i in (1..arr.length)
    mins[i] = [mins[i-1], sums[i]].min
  end

  puts "MINS: " + mins.inspect

  diffs = Array.new(arr.length)

  for i in (0..arr.length - 1)
    diffs[i] = sums[i + 1] - mins[i]
  end

  return diffs.max
end

puts maxSubArray([2, -1, 2, 3, 4, -5])
