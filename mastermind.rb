=begin
Computer vs User
Computer generates 4 numbers between 1-6, user has 12 rounds to guess the correct number and order.
If the user guesses the correct number but in the wrong index an "O" is displayed.
If the user guesses the correct number in the correct index an "X" is displayed.
The goal is to guess all 4 numbers in order and have 4 "X" displayed ("XXXX").
User vs Computer
Same as above but user will create a seceret code and the computer will have 12 rounds to guess the code.
=end

class Mastermind

    def initialize()
      @computer_choice = computer_choice
    end

    #creates a random code of 4 numbers each number upto 6.
    def computer_choice
      @computer_code = (1..6).to_a.shuffle.take(4)
    end

    #takes user code input and checks for validity, if false the  method runs again.
    def input
      @human_input = gets.chomp.scan(/\d/).map(&:to_i)
        if valid_input?
          @human_input
        else
          puts "INVALID CODE"
          input
        end
    end

    #checks if the user input is correct (lengthh of 4 and up to or eqaul to 6).
    def valid_input?
      @human_input.length == 4 && @human_input.all? { |n| n <= 6 }
    end

    #Starts welcome message and asks if user would like to guess the code or create it.
    def decide
      puts 'Welcome to mastermind'
      puts 'Would you like to guess the code or would you like to create the code? (type: create or guess)'
      decision = gets.chomp.downcase
        if decision == "create"
          set_code
          gameplay_create
        else
          gameplay_guess
        end
    end

    #asks user to create code if create is previously chosen.
    def set_code
      puts 'To create a code please type 4 numbers between 1-6 (in any order):'
      input
    end

    #takes both user input and computer code and zips the arrays together. Then code checks for matches
    #if there are less than 4 matches the code removes the matches and returns the arrays
    #then we loop through the user index with the computer and find the same numbers and return a value
    def compare
      pairs = @computer_code.zip(@human_input)
      @matches = pairs.count { |computer,human| computer == human}
    return unless @matches < 4

      computer, human = pairs.reject {|computer,human| computer == human}.transpose
        human.each do |n|
          i = computer.index(n)
          computer.delete_at(i) if i
          end
          @same_number = human.size - computer.size
      end
    end

    #For every match an "X" is diplayed to the user.
    #For every same number in the wrong index an "O" is displayed for the user.
    def symbols
      @matches.times {print 'X'}
        if @matches < 4 then
          @same_number.times {print 'O'}
        end
    end

    #When create is chosen a loop is executed.
    #The loop coninues for 12 rounds or until the code is guessed correctly
    #The loop takes computer choice and executes the compare method and displays applicable symbolls
    #At the end of each loop we check for winning results to end.
    def gameplay_create
      @matches = 0
      @i = 0
        until @i == 12 || @matches == 4
          computer_choice
          print "#{@computer_code.join(', ')} = "
          compare
          symbols
          puts
          puts '-----------------'
          results_create
      @i += 1
         end
    end

    #Same as above but loops for when the user is guessing the code
    def gameplay_guess
      @matches = 0
      @i = 0
        until @i == 12 || @matches == 4
          puts 'Guess four numbers up to 6'
          input
          compare
          print "#{@human_input.join(', ')} = "
          symbols
          puts
          puts '-----------------'
          results_guess
        @i += 1
        end
    end

    #checks for matches and number of rounds and returns a string when true
    def results_guess
      if @matches == 4
        puts 'You win! you guessed the correct code and beat the Computer!'
      elsif @i == 11
        puts 'Better luck next time, the Computer wins.'
      end
    end

    def results_create
      if @matches == 4
        puts 'You lose, the Computer cracked your code!'
      elsif @i == 11
        puts 'You win! the Computer could not crack your secret code.'
      end
    end

    Mastermind.new.decide