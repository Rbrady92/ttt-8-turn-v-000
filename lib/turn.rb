board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

turn_count = 1

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def board_reset(board)
  curr = 0
  while curr < 9
    board[curr] = " "
    curr += 1
  end
end



def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  end
  true
end

def valid_move?(board,index)
  if !position_taken?(board, index) && index < 10 && index >= 0
    return true
  end
  false
end

def input_to_index(input)
  input = input.to_i - 1
end



def move(board,index,turn_count)
  turn_count % 2 == 0 ? player_turn = "o" : player_turn = "x"
  board[index] = player_turn
end




def game_over?(board)
  curr = 0
  while curr <= 8
    if board[curr] != " " && (board[curr] == board[curr + 1] && board[curr] == board[curr + 2])
      display_board(board)
      puts "#{board[curr]} is the winner!"
      return true
    elsif  board[curr] != " " && (board[curr] == board[curr + 3] && board[curr] == board[curr + 6])
      display_board(board)
      puts "#{board[curr]} is the winner!"
      return true
    else
      curr += 3
    end
  end
  if  board[curr] != " " && ((board[0] == board[4] && board[8] == board[4]) || (board[2] == board[4] && board[6] == board[4]))
    display_board(board)
    puts "#{board[4]} is the winnner!"
    return true
  end
  return false
end




def turn(board, turn_count)

  display_board(board)

  if turn_count > 5
    game_over?(board)
    if game_over?(board)
      puts "play again?"
      reset = gets.strip
      if reset == "y" || reset == "yes"
        board_reset(board)
        turn_count = 1
        turn(board, turn_count)
      end
    end
  end

  puts "Please enter 1-9:"

  desired_move = gets.strip

  desired_move = input_to_index(desired_move)

  if valid_move?(board,desired_move)
    move(board,desired_move,turn_count)
    turn_count += 1
    turn(board, turn_count)
  else
    puts "This position is either taken or invalid"
    turn(board, turn_count)
  end
end


#turn(board, turn_count)
