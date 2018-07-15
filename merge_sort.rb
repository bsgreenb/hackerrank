def merge_sort(arr)
  if arr.length <= 1
    return arr
  else
    # Split them
    mid_point = (arr.length - 1) / 2
    arr_1 = merge_sort(arr[0..mid_point])
    arr_2 = merge_sort(arr[mid_point + 1..-1])

    # Combine them
    # Use offsets to keep track
    offset_1 = 0
    offset_2 = 0

    new_arr = []
    # Loop til we reach end of one of them
    while offset_1 < arr_1.length && offset_2 < arr_2.length do
      if arr_1[offset_1] <= arr_2[offset_2]
        new_arr << arr_1[offset_1]
        offset_1 +=1
      else
        new_arr << arr_2[offset_2]
        offset_2 +=1
      end
    end

    while offset_1 < arr_1.length
      new_arr << arr_1[offset_1]
      offset_1 += 1
    end

    while offset_2 < arr_2.length
      new_arr << arr_2[offset_2]
      offset_2 += 1
    end

    new_arr
  end
end

puts merge_sort([6, 31415926535897932384626433832795, 1, 3, 10, 3,5]).inspect
