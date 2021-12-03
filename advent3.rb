inputComms = %w(
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
)

def findMostCommon(input)
  posMap = {}
  input[0].length.times do |i|
    posMap[i] = {
      0 => 0,
      1 => 0
    }
  end

  input.each do |input_line|
    input_line.each_char.with_index do |bit, index|
      posMap[index][bit.to_i] += 1
    end
  end

  gammaRate = ""
  epsilonRate = ""

  posMap.each do |key, entry|
    if entry[0] > entry[1]
      gammaRate << "0"
      epsilonRate << "1"
    else
      gammaRate << "1"
      epsilonRate << "0"
    end
  end
  return posMap
end

currList = inputComms
inputComms[0].length.times do |i|
  if currList.length == 1
    break
  end
  currPosMap = findMostCommon(currList)
  currentLookedAt = currPosMap[i]
  if currentLookedAt[0] > currentLookedAt[1]
    mostCommon = 0
  else
    mostCommon = 1
  end
  newCurrList = []
  currList.each do |entry|
    if entry[i].to_i == mostCommon
      newCurrList << entry
    end
  end

  currList = newCurrList
end

oxygen = currList[0]
puts oxygen

currList = inputComms
inputComms[0].length.times do |i|
  if currList.length == 1
    break
  end
  currPosMap = findMostCommon(currList)
  currentLookedAt = currPosMap[i]
  if currentLookedAt[0] > currentLookedAt[1]
    mostCommon = 1
  else
    mostCommon = 0
  end
  newCurrList = []
  currList.each do |entry|
    if entry[i].to_i == mostCommon
      newCurrList << entry
    end
  end

  currList = newCurrList
end

co2 = currList[0]

puts oxygen
puts co2

puts oxygen.to_i(2) * co2.to_i(2)
