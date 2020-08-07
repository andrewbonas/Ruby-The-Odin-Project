class Gameboard
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    Array.new(8) {Array.new(8, []) }
  end
end

class Knight
  attr_reader :gameboard

  def initialize(gameboard)
    @gameboard = gameboard
  end

  def add_move(square, moves)
    row = square[0]
    col = square[1]

    if row >= 0 && row <= 7 && col >= 0 && col <= 7
        moves << square
    end
  end

  def moves(square)
    row = square[0]
    col = square[1]
    possible_moves = []

    add_move([row + 1, col - 2], possible_moves)
    add_move([row + 1, col + 2], possible_moves)
    add_move([row - 1, col - 2], possible_moves)
    add_move([row - 1, col + 2], possible_moves)
    add_move([row + 2, col + 1], possible_moves)
    add_move([row + 2, col - 1], possible_moves)
    add_move([row - 2, col - 1], possible_moves)
    add_move([row - 2, col - 1], possible_moves)

   possible_moves
  end

  def knight_moves(start_sq, end_sq)
    path = []
    path << end_sq

    until path.first == start_sq
      previous = find_previous_move(start_sq, path.first)
      path.unshift(previous)
    end

    print_path(path)
  end

  def print_path(moves)
    moves.each { |square| p square}
  end

  def find_previous_move(start_sq, end_sq)
    queue = []
    queue << start_sq

    until queue.empty?
        sq = queue.shift
        possible_moves = moves(sq)

        possible_moves.each do |move|
            queue << move

            return sq if move == end_sq
        end
    end
  end
end
gameboard = Gameboard.new
knight = Knight.new(gameboard)

knight.knight_moves([0, 0], [7, 7])