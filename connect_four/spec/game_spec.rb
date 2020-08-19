require '../lib/game.rb'

RSpec.describe Game do
    describe '#current_player' do
      it 'Alternates between player 1 and player 2' do
        expect(subject.current_player).to eq('X')
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

    describe '#vertical_win?'
      it 'Returns true if 4 of the same tokens are in a vertical row' do
        subject.board[0][0] = 'X'
        subject.board[0][1] = 'X'
        subject.board[0][2] = 'X'
        subject.board[0][3] = 'X'
      expect(subject.win?).to be true
    end

    describe '#horizontal_win?'
      it 'Returns true if 4 of the same tokens are in a horizontal row' do
        subject.board[0][0] = 'X'
        subject.board[1][0] = 'X'
        subject.board[2][0] = 'X'
        subject.board[3][0] = 'X'
      expect(subject.win?).to be true
    end

    describe '#diagonal_win_down?'
    it 'Returns true if 4 of the same tokens are in a diagonal row down' do
      subject.board[0][0] = 'X'
      subject.board[1][1] = 'X'
      subject.board[2][2] = 'X'
      subject.board[3][3] = 'X'
    expect(subject.win?).to be true
  end
  describe '#diagonal_win_up?'
    it 'Returns true if 4 of the same tokens are in a diagonal row up' do
      subject.board[5][0] = 'O'
      subject.board[4][1] = 'O'
      subject.board[3][2] = 'O'
      subject.board[2][3] = 'O'
    expect(subject.win?).to be true
  end

  describe '#diagonal_win?'
    it 'Returns false if four of the same token are not in a row' do
      subject.board[0][0] = 'X'
      subject.board[1][3] = 'X'
      subject.board[2][2] = 'X'
      subject.board[3][3] = 'X'
    expect(subject.win?).to be false
  end

  describe '#diagonal_win_up?'
    it 'Only retuns win with the same four tokens in a row' do
      subject.board[5][0] = 'X'
      subject.board[4][1] = 'O'
      subject.board[3][2] = 'X'
      subject.board[2][3] = 'O'
    expect(subject.win?).to be false
  end

  describe '#tie?'
  it 'Only retuns win with the same four tokens in a row' do
    subject.board[0].fill('X')
  expect(subject.tie?).to be true
end
end