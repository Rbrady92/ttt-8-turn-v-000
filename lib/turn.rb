def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  end
  return true
end

def valid_move?(board,index)
  if !position_taken?(board, index) && index < 10 && index > 0
    return true
  end
  return false
end

def input_to_index(input)
  input = input.to_i - 1
end


def move(board,index)
  board[index] = "x"
end


def turn(board)
  puts "Please enter 1-9:"
  desired_move = gets.strip
  desired_move = input_to_index(desired_move)

  if valid_move?(board, desired_move)
    move(board,desired_move)
    display_board
  else
    puts "This position is taken"
    turn(board)
  end
end
