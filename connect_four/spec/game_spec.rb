require '../lib/game.rb'

describe Game do
    describe '#current_player' do 
      it 'Atlernates between player 1 and player 2' do
        round = Game.new
        round.game(2)
        expect(subject.current_player).to eq('X')
      end
    end
  
    describe '#valid?' do
      it 'Returns true when the user chooses a number less than 6' do
          expect(subject.valid?).to eq true
      end
    end
  end