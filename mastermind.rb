class Mastermind

    def initialize()
        @computer_choice = computer_choice
        @gameplay = gameplay
    end

    def computer_choice
     p  @computer_code = (1..6).to_a.shuffle.take(4)
    end

    def compare
        pairs = @computer_code.zip(@human_guess)
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

    def symbols
        @matches.times {print 'X'}
        if @matches < 4 then
            @same_number.times {print 'O'}
        end
    end

    def gameplay
        @matches = 0
        i = 0
          while i < 12 && @matches < 4
            puts 'Guess four numbers up to 6'
            @human_guess = gets.chomp.scan(/\d/).map(&:to_i)
            compare
            print "#{@human_guess.join(', ')} = "
            symbols
            puts
            results
        i += 1
          end
    end

    def results
        if @matches == 4
            puts 'You win! you guessed the correct code and beat the Computer'
        elsif gameplay == 11
            puts 'Better luck next time, the Computer wins'
        end
    end


    Mastermind.new
   