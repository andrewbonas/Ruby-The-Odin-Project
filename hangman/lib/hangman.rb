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

# Generates random word between 5 & 12 characters long from text file.
  def secret_word
    File.readlines('5desk.txt').select { |w| w.size > 4 && w.size < 13 }.sample.strip.downcase
  end

# Does not run update display unless an input is given.
  def hidden_display last_guess = nil
    update_display(last_guess) unless last_guess.nil?
    puts @hidden_secret_word
  end

# Updates display replacing "_" if the letter that was guessed is correct otherwise the hidden word is displayed again.
  def update_display last_guess
  new_display = @hidden_secret_word.split

  new_display.each_with_index do |letter, index|
    if letter == '_' && @secret_word[index] == last_guess
        new_display[index] = last_guess
      end
    end
  @hidden_secret_word = new_display.join(' ')
  end

# If game is loaded we display welcome message and the previous hidden message and then execute the user guess method.
  def loaded_game
    puts "Welcome back, here is where you left off: "
    hidden_display
    user_guess
  end

# If there are more rounds available than 0 the user can guess a letter or save the state.
# We then check to make sure the input is valid. I "save" is chosen the save method is executed.
# If a letter is guessed we compare it against our secret word. If it is correct we add the hidden display with the guessed word for the user.
# Every round we check to see if the user has guessed the whole word correctly.
# If the word is incorrect we subtract a round from the user.
# If no rounds are left = game over.
  def user_guess
    if @rounds > 0
      puts "Guess a letter or type 'save' to save game"
      @guess = gets.chomp.downcase
      valid_input?
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
      puts "Incorrect, there are no #{@guess.upcase}'s, Please try again (#{@rounds} left)"
      user_guess
    end
    else
      puts 'Game Over'
    end
  end

# Game begins with checking if the user wants to start new game or load game from YAML.
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

# Checking if input is valid during the guessing rounds (1 digit or save) when user checks for a letter.
  def valid_input?
    if @guess.length == 1 || @guess == 'save'
      @guess
    else
      puts "INVALID INPUT"
      user_guess
    end
  end

  private

# Saves current state of game. Once game is saved the program ends.
  def save_game
    yaml = YAML::dump(self)
    File.open("save.yaml", "w+") {|x| x.write yaml}
    puts "Game saved"
    exit
  end

# Loads previously saved game froom .yaml file
  def load_game
    save_state = YAML.load_file("save.yaml")
    save_state.loaded_game
  end

end

game = Hangman.new
game.start_game