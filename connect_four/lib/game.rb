require_relative 'board'

class Game < Board

    def initialize
      super
      @intro = intro
    end
  
    def intro
      puts 'To play choose columns 1-7 first player to get 4 in a row wins!'
      puts
      print_board
      game
    end
  
    def play_round
      puts 'Pick a column 1-7'
      @input = gets.to_i - 1
      if valid?
        move(@input, current_player)
        print_board
      else
        play_round
      end
    end

    def game
      @counter = 0
      until over?
        play_round
        @counter +=1
      end
    
      if win?
        puts "Game over. Sorry #{current_player} you loose!"
      elsif tie?
         puts "It's a tie!"
      end
    end
  
    def move(column, token = current_player)
      n = 5
      until n.zero? || @board[n][column] == "."
        n -= 1
      end
        
      if @board[n][column] == "."
        @board[n][column] = token
      else
        puts "FULL, try another column"
        game
      end
     end
  
    def valid?
      @input <= 6 
    end

    def current_player(player = nil)
      if(@counter % 2).zero?
        player = 'X'
      else
        player = 'O'
      end
      return player
    end
  
    def tie?
      @counter == 42
    end
  
    def over?
      tie? || win?
    end

    def win?
      vertical_win? || hortizontal_win? || diagonal_win_down? || diagonal_win_up?
    end
    
   def vertical_win?(board = @board)
    board.each do |column|
      column.each_index do |i, array = []|
        4.times {|n| array << column[i + n]}
        return true if connected?(array)
        end
      end
      false
   end
    
   def hortizontal_win?
    vertical_win?(board.transpose)
   end

   def diagonal_win_down?(board = @board)
    board.each_index do |c|
      board[c].each_index do |r, array=[]|
        4.times {|n| array << board[c+n][r+n] if board[c + n]}
        return true if connected?(array)
      end
    end
    false
   end
   
   def diagonal_win_up?(board = @board)
    diagonal_win_down?(board.map(&:reverse))
   end

   def connected?(array)
    array.size == 4 && array.uniq.size == 1 && array[0] != "."
   end
end

Game.new