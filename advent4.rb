require 'pry'
require 'pry-byebug'

moves = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]

boardsInput = "
22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
 ".strip.split("\n").reject(&:empty?)


boards = []
currentBoard = []

boardsInput.each_with_index do |row, index|
  if index % 5 == 0 && index > 0
    boards << currentBoard
    currentBoard = []
  end

  currentBoard << row.split(" ").map { |num| num.to_i }
end

boards << currentBoard

def hasBoardWon(board)
  board.each do |row|
    if row.all? { |elem| elem.nil? }
      return true
    end
  end

  (0..4).each do |col|
    currentColNil = true
    (0..4).each_with_index do |row|
      unless board[row][col].nil?
        currentColNil = false
      end
    end
    if currentColNil
      return true
    end
  end
  return false
end

boardWinCounter = 0
boardLength = boards.length
moves.each do |move|
  newBoards = boards.dup
  boards.each do |board|
    board.each do |row|
      index = row.index(move)

      if index
        row[index] = nil
      end
    end

    if hasBoardWon(board)
      boardWinCounter += 1
      newBoards.delete(board)
      if boardWinCounter == boardLength
        boardSum = 0
        board.each do |row|
          row.each do |elem|
            unless elem.nil?
              boardSum += elem
            end
          end
        end
        puts boardSum * move
        return
      end
    end
  end
  boards = newBoards
end



