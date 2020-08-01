=begin
hangman, 
Computer generates word from the list of words in txt file.
The word is stored and the game starts with 5 round.
Lines are displayed to indicate how many letters are in the word
each round the user takes a guess of a letter, if the letter is in
the word the letter replaces the line and does not count as a turn.
if the letter is incorrect the letter is placed to the side and a turn is taken
at the end of 5 rounds if the word is not solved the user looses
end
=end
require 'yaml'

class Hangman

  def initialize
    @secret_word = secret_word
    @rounds = 5
    @hidden_secret_word = ''

    @secret_word.size.times do
        @hidden_secret_word += '_ '
      end
  end

  def secret_word
  p File.readlines('5desk.txt').select { |w| w.size > 4 && w.size < 13 }.sample.strip.downcase
  end

  def hidden_display last_guess = nil
    update_display(last_guess) unless last_guess.nil?
    puts @hidden_secret_word
  end

  def update_display last_guess
  new_display = @hidden_secret_word.split

  new_display.each_with_index do |letter, index|
    if letter == '_' && @secret_word[index] == last_guess
        new_display[index] = last_guess
      end
    end
  @hidden_secret_word = new_display.join(' ')
  end

  def user_guess
    if @rounds > 0
    puts "Guess a letter or type 'save' to save game"
    @guess = gets.chomp.downcase
     if @guess == "save"
        save_game
     end
    correct = @secret_word.include? @guess

    if correct
      puts "That's correct!"

      hidden_display @guess
    
    if @secret_word == @hidden_secret_word.split.join
      puts 'Nice job, you guessed the secret word!'
    else
      user_guess
    end
    else
      @rounds -=1
      puts "Sorry wrong guess, try again (#{@rounds} left)"
      user_guess
    end
    else
      puts 'Game Over'
    end
  end

  def start_game
    puts 'Welcome to Hangman! Would you like to start a new game or load a game? (Type: load/new)'
    game_option = gets.chomp.downcase
      if game_option == "load"
        load_game
      else 
        hidden_display
        user_guess
      end
  end
  private

  def save_game
    yaml = YAML::dump(self)
    File.open("save.yaml", "w+") {|x| x.write yaml}
    puts "Game saved"
    exit
  end

  def load_game
    save_state = YAML.load_file("save.yaml")
    puts "Welcome back"
    
    p save_state.dig("@hidden_secret_word")
    save_state.user_guess
  end
end

game = Hangman.new
game.start_game