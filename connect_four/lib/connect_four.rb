class Board

def initialize
  @create_board = create_board
  @print_board = print_board
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
p @board
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

Board.new