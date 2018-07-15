def nonDivisibleSubset(k, arr)
    groups = []

    arr.each do |n|
      if !groups[n%k]
        groups[n%k] = []
      end
      groups[n%k].push(n)
    end

    return groups
    # arr.each do |n|
    #     groups.each do |group|
    #         add_to_group = true
    #         group.each do |other_n|
    #             if (n + other_n) % k == 0
    #               add_to_group = false
    #               break
    #             end
    #         end
    #         group.push(n) if add_to_group
    #     end
    #     groups.push([n])
    # end
    #
    # puts groups.inspect
    #
    # largest_group_length = 0
    # groups.each do |group|
    #     if group.length > largest_group_length
    #         largest_group_length = group.length
    #     end
    # end
    #
    # return largest_group_length
end

puts nonDivisibleSubset(5, [770528134, 663501748, 384261537, 800309024, 103668401, 538539662, 385488901 , 101262949, 557792122, 46058493]).inspect
