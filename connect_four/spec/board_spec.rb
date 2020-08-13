require '../lib/board.rb'

describe Board do
    describe '#create_board' do 
      it 'Creates a board with each row of 6 spots.' do
        expect(subject.create_board.length).to be 6
      end
      it 'Creates a board with each column of 7 spots.' do
        expect(subject.create_board.count).to be 6
        end
      end
  end