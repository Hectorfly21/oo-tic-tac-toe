class TicTacToe
   def initialize(board = nil)
   @board = board || @board = Array.new(9, " ")
   end
WIN_COMBINATIONS = [
     [0,1,2], #top row
     [3,4,5], #middle row
     [6,7,8], #bottom row
     [0,3,6], #left column
     [1,4,7], #middle column
     [2,5,8], #right column
     [0,4,8], #left diagonal column
     [2,4,6] #right diagonal column
]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1 
  end 
  def move(index, character= "X")
    @board[index] = character
  end
  def position_taken?(index)
    @board[index] != " "
  end
  def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
  end
  def turn_count
    @board.count{|turn| turn != " " }
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
     token = current_player
     move(index, token)
    else
     turn
    end
    display_board
  end
  def won?
    WIN_COMBINATIONS.any? do |index|
      if position_taken?(index[0]) && @board[index[0]] == @board[index[1]] && @board[index[1]] == @board[index[2]]
        return index
      end
    end
  end

  def full?
    @board.all?{|full| full != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if index = won?
      @board[index[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end