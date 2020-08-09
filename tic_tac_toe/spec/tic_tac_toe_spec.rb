require './lib/tic_tac_toe.rb'

describe TicTacToe do
  it "Returns a board of 9 spots." do
    expect(subject.board.length).to be == 9
    end

  describe "#valid_move?" do
    it "Return true if input under 10." do
      expect(subject.valid_move?(4)).to eq true
      end
    end
    it "Return false if input is over 9." do
      expect(subject.valid_move?(10)).to eq false
    end
  
  describe "#won?" do
    it "Returns the 1st 3 board indexes in the array if 3 Xs occupy the top row." do
      subject.board = %w[X X X 4 5 6 7 8 9]
      expect(subject.won?).to eq([0, 1, 2])
    end
    it "Returns center of board indexes in array if 3 Os occupy the center row" do
      subject.board = %w[1 O 3 4 O 6 7 O 9]
      expect(subject.won?).to eq([1, 4, 7])
    end
    it "Returns diagonal of board indexes in array if 3 Xs occupy a diagonal row" do
      subject.board = %w[X 2 3 4 X 6 7 8 X]
      expect(subject.won?).to eq([0, 4, 8])
    end
  end
 end
