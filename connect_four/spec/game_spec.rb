require '../lib/game.rb'

describe Game do
    describe '#current_player' do
      it 'Alternates between player 1 and player 2' do
        expect(Game.new.current_player).to eq('O')
      end
    end
  
    describe '#valid?' do
      it 'Returns true when the user chooses a number less than 6' do
        allow_any_instance_of(Game).to receive(:gets).and_return(3)
        expect(Game.new.valid?).to eq true
      end
    end

    describe '#move' do
      it 'Returns token if spot on the board is empty' do
        allow_any_instance_of(Game).to receive(:gets).and_return(3)
        expect(Game.new.move(5, 'X')).to eql 'X'
        end
      end

    describe '#vertical_four'
      it 'Returns true if 4 of the same tokens are in a row vertically'
      array = [X,X,X,X]
      expect(subject.vertical_four).to be true
  end