
class Game
    attr_accessor :word
    
    @@phrases = [
        ["ice cream", "--- -----"],
        ["television", "----------"],
        ["steve jobs", "----- ----"],
        ["ruby", "----"]
    ]
    
    def initialize
        @word = @@phrases[rand(@@phrases.size)]
        @phrase = @word[0]
        @template = @word[1]
        @guesses = 0
    end
    
    def fill(letter)
        pos = 0
        correct = false
        while pos < @template.length
            if @phrase[pos] == letter
                @template[pos] = letter
                correct = false
            end
            pos += 1
        end
        if correct == false
            @guesses += 1
        end
    end
    
    def play
        while @template != @phrase && @guesses < 10 do
            puts @template
            puts "Make your guess"
            guess = gets.chomp
            if guess.length > 1 
                puts "only one letter guesses"
            else
                fill(guess)
            end
        end
        
        if @template == @phrase 
            puts "Congrates you got it!"
            puts @template
        else
            print "The man hung! your word was "
            puts @phrase
        end
    end

end

game = Game.new
game.play