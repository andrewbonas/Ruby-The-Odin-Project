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
        move(5, @input, current_player)
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
      if won?
          'Way ta go'
      elsif tie?
          'tie'
      end
    end
  
    def move(col, row, token = current_player)
      @board[col][row] = token
    end
  
    def valid?
      @input <= 6
    end
  
    def current_player
      player = nil
      if(@counter % 2).zero?
        player = 'X'
      else
        player = 'O'
      end
      return player
    end
  
    def tie?
      @counter == 2
    end
  
    def won?
  
    end
  
    def over?
      tie? || won? 
    end
  end

  game = Game.new