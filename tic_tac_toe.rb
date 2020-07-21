=begin
Tic tac toe requires two players on a board of 3x3.
The board is labeld in order 1 to 9
Player 1 has an X that replaces a number on the 3x3 board.
Player 2 has an O that replaces a number on the 3x3 board.
Each Player takes one turn in each round.
When one of the players has 3 in a row that player wins the game
and the game is reset.
=end

class TicTacToe
  attr_accessor :board

  # display of numbers to be replaced by X or O

  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
    @display_board = display_board
  end

  # all the options for winning on the board

  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]].freeze

  # completes a display of the board for a visual reference

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  # method to replace index values with our tokens (X,O)

  def move(index, token = 'X')
    @board[index] = token
  end

  # asking if the spot has already been taken by the other player

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  # method to make sure option is a valid spot on the board

  def valid_move?(input) 
    input.between?(0,8) && !position_taken?(input)  
  end

  # taking user input and applying the token to the board and confirming the user choice is valid

  def turn
    puts 'Choose spots 1-9'
    input = gets.to_i - 1
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  # keeping track of who's turn it is

  def turn_count
    counter = 0
    @board.each do |i|
    if i == "X" || i == "O" 
      counter += 1
    end
    end
      return counter
  end

  def current_player
    player = nil
    if (turn_count() % 2).zero?
      player = 'X'
    else
      player = 'O'
    end
    return player
  end
  
# checking constant to see if there is a winner

  def won?
  WIN_COMBOS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
    end
  end

# did we reach a full board with no winners?

  def full?
    turn_count == 9
  end

# was there a draw? with no winners after filling up the board?

  def draw?
    !won? && full?
  end

# the game is over if its a tie, a winner or a full board

  def over?
    draw? || won? || full?
  end

# we look for a winner through the combonations of elements to find if it is X or O

  def winner
    won = ""
    if winner = won?
      won = @board[winner.first]
    end
  end

# looping until there is a winner, a tie or a full board

  def play
    until over?
      turn
    end
    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Tie'
    end
  end
end

game = TicTacToe.new
game.play
