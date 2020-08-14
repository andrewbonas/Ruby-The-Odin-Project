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
  
    def rounds
     @counter = 0
    end

    def game
      rounds
      until over?
        play_round
        @counter +=1
      end
      if won?
          'Way ta go'
      elsif tie?
          'tie'
      end
    end
  
    def move(row, token = current_player)
      n = 5
      until n.zero? || @board[n][row] == @empty
        n -= 1
      end
        
      if @board[n][row] == @empty
        @board[n][row] = token
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
      @counter == 3
    end
  
    def won?
  
    end
  
    def over?
      tie? || won? 
    end
  end

  game = Game.new