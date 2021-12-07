require 'pry'
require 'pry-byebug'

input = "1,2,1,1,1,1,1,1,2,1,3,1,1,1,1,3,1,1,1,5,1,1,1,4,5,1,1,1,3,4,1,1,1,1,1,1,1,5,1,4,1,1,1,1,1,1,1,5,1,3,1,3,1,1,1,5,1,1,1,1,1,5,4,1,2,4,4,1,1,1,1,1,5,1,1,1,1,1,5,4,3,1,1,1,1,1,1,1,5,1,3,1,4,1,1,3,1,1,1,1,1,1,2,1,4,1,3,1,1,1,1,1,5,1,1,1,2,1,1,1,1,2,1,1,1,1,4,1,3,1,1,1,1,1,1,1,1,5,1,1,4,1,1,1,1,1,3,1,3,3,1,1,1,2,1,1,1,1,1,1,1,1,1,5,1,1,1,1,5,1,1,1,1,2,1,1,1,4,1,1,1,2,3,1,1,1,1,1,1,1,1,2,1,1,1,2,3,1,2,1,1,5,4,1,1,2,1,1,1,3,1,4,1,1,1,1,3,1,2,5,1,1,1,5,1,1,1,1,1,4,1,1,4,1,1,1,2,2,2,2,4,3,1,1,3,1,1,1,1,1,1,2,2,1,1,4,2,1,4,1,1,1,1,1,5,1,1,4,2,1,1,2,5,4,2,1,1,1,1,4,2,3,5,2,1,5,1,3,1,1,5,1,1,4,5,1,1,1,1,4"
days = 256

fishTimers = input.split(',').map { |timer| timer.to_i }
fishTimerDict = {}

fishTimers.each do |fish|
  unless fishTimerDict.key?(fish)
    fishTimerDict[fish] = 0
  end

  fishTimerDict[fish] += 1
end

days.times do |day|
  fishToAdd = 0
  newFishTimerDict = {}
  fishTimerDict.each do |age, fishCount|
    if age == 0
      if newFishTimerDict.key?(6)
        newFishTimerDict[6] += fishCount
      else
        newFishTimerDict[6] = fishCount
      end
        fishToAdd += fishCount
    else
      if newFishTimerDict.key?(age - 1)
        newFishTimerDict[age - 1] += fishCount
      else
        newFishTimerDict[age - 1] = fishCount
      end
    end
  end

  if fishToAdd > 0
    unless newFishTimerDict.key?(8)
      newFishTimerDict[8] = 0
    end

    newFishTimerDict[8] += fishToAdd
  end
  fishTimerDict = newFishTimerDict
end

puts fishTimerDict.values.sum


