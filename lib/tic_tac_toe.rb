WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Top column
  [1,4,7], # Middle column
  [2,5,8], # Bottom column
  [0,4,8], # Diag A
  [6,4,2], # Diag B
]

#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(input)
  index = input.to_i - 1
end

def move(board,index,character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#valid_move?
def valid_move?(board,index)
  if ( index.between?(0,8) && position_taken?(board,index) == false)
    return true
  end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,character="X")
    display_board(board)
  else turn(board)
  end
end

#turn_count
def turn_count(board)
  counter = 0
  board.each do |index|
  if !(index.nil? || index == " ")
    counter += 1
  end
  return counter
end

#current_player
def current_player(board)
  if turn_count(board) % 2 = 0
    return "X"
  else
    return "O"
  end
end
