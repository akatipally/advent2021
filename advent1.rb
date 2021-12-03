arr = %w(
  199
  200
  208
  210
  200
  207
  240
  269
  260
  263
)
length = arr.length

increase_count = 0
arr.each_with_index do |value, index|
  if index == 0
    next
  end
  if arr[index - 1] < value
    increase_count += 1
  end
end

puts increase_count

increase_count = 0
puts length
arr.each_with_index do |value, index|
  if index < 3
    next
  end
  if index == length
    puts index
    break
  end
  if arr[index - 3..index - 1].sum < arr[index - 2..index].sum
    increase_count += 1
  end
end

puts increase_count
