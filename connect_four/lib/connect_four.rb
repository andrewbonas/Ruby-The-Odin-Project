class Board

  def initialize
    @create_board = create_board
  end

  def create_board
    @board = []
    @rows = 6
    @columns = 7
    hole = "\u25A2"

    @rows.times do |row|
    @board[row] = []

    @columns.times do |cols|
    @board[row] << "#{hole.encode('utf-8')}"
      end
    end
    @board
  end

  def print_board
    star = "\u2605"
    line = "\u2501"
    puts "---------- #{star.encode('utf-8')} CONNECT 4 #{star.encode('utf-8')} ----------"
    puts "  1    2    3    4    5    6    7"

      for row in @board
      for col in row
        print "| #{col} |"
      end
      puts "\n"
      end
    35.times {print line.encode('utf-8')}
    puts
  end
end

class Game < Board

  def initialize
    super
    @intro = intro
  end

  def intro
    puts "To play choose columns 1-7 first player to get 4 in a row wins!"
    puts
    print_board
    game_play
  end
  
  def game_play
    puts 'Pick a column 1-7'
    @input = gets.to_i - 1
    if valid?
      turn
    end
  end

  def move(col, row, token = "X")
    @board[col][row] = token
  end

  def turn
   move(5, @input, "X")
   print_board
  end

  def valid?
    @input <= 6
  end

end

Game.new