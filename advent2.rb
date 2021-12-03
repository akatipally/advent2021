commands_input = %w(
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
)
arr_length = commands_input.length
commands = []

commands_input.each_with_index do |value, index|
  if index.odd?
    next
  end

  if index == arr_length - 1
    break
  end

  commands.append([value, commands_input[index + 1]])
end

# puts commands.length

vertical_position = 0
horizontal_position = 0
aim = 0

commands.each do |command|
  direction = command[0]
  distance = command[1].to_i

  if direction == 'forward'
    # puts distance
    # puts aim
    adj_distance = distance * aim
    horizontal_position += distance
    vertical_position += adj_distance
  elsif direction == 'down'
    aim += distance
  elsif direction == 'up'
    aim -= distance
  end
  puts 'direction ' + direction.to_s
  puts 'distance ' + distance.to_s
  puts 'current vert ' + vertical_position.to_s
  puts 'current hor ' + horizontal_position.to_s
  puts 'current aim ' + aim.to_s
  puts "\n"
end

puts horizontal_position * vertical_position
