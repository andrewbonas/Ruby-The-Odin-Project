require './lib/connect_four.rb'

describe Board do
  describe '#create_board' do 
    it 'Creates a board with each row of 6 spots.' do
      expect(subject.create_board.length).to be 6
    end
    it 'Creates a board with each column of 7 spots.' do
      expect(subject.create_board.count).to be 6
      end
    end

  describe '#update_display' do
    xit 'Returns a user marker at the bottom to the bottom row of the display.'
      expect(subject.update_display(1, X)).to eq(board[5][0])
  end
end
    
describe Player do
  describe '#current_player' do 
    xit 'Atlernates between player 1 and player 2' do
      turn_count(3)
      expect(subject.update_player).to eq('O')
    end
  end
end
    
describe Game do
  describe '#valid?' do
    xit 'Returns invalid when the user chooses a number greater than 7' do
    expect(subject.valid?(10)).to eq false
    end
  end
end

