class Mastermind

    def initialize()
        @computer_choice = computer_choice
        @gameplay = gameplay

    end

    def computer_choice
      p @computer_code = (1..6).to_a.shuffle.take(4)
    end

    def compare
        
        pairs = @computer_code.zip(@human_guess)
        @matches = pairs.count { |computer,human| computer == human}
        if @matches < 4 then
            computer, human = pairs.reject {|computer,human| computer == human}.transpose
                human.each do |n|
                    i = computer.index(n)
                    computer.delete_at(i) if i
                end
                @same_number = human.size - computer.size
            end
        end
    end
    

    def match_symbol
        @matches.times {puts "X"}
        if @matches < 4 then
            @matches.times {puts "X"}
        end
    end

    def gameplay
        @matches = 0
        i = 0
          while i < 12 && @matches < 4
            puts 'Guess four numbers up to 6'
            @human_guess = gets.chomp.scan(/\d/).map(&:to_i)
            compare
            print symbols
              if @matches == 4
                puts "You win! you guessed the correct code and beat the computer"
            elsif i == 12
                puts "Better luck"
            end
            i += 1
        end
        @human_guess
    end

    Mastermind.new