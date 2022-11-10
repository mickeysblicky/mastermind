require 'colorize'


def random_code_generator
    $code = []
    for a in 1..4 do
        random = Random.rand(1..6)
        $code << random.to_s
    end
end

def guess
    instance_code = $code.join.split("")
    board = "___|___\n   |   "
    puts "Input guess."
    $g = gets.chomp.to_s.split("")
    if $g.join == 'exit'
        puts "exiting..."
        exit
    elsif $g.join == 'restart'
        puts "restarting..."
        game()
    elsif $g.join.length == 4 && $g.join != 'exit' && $g.join != 'restart'
        $black_circles = 0
        $white_circles = 0
        $code.each_with_index do |number, index|
            
            if $g.any? {|num| $g.at(index) == $code.at(index)}
                $g.insert(index, "B")
                $g.slice!(index+1)
                instance_code.insert(index, "NCB")
                instance_code.slice!(index+1)
                $black_circles += 1
            end
            
        end

        $g.each_with_index do |number, index|
            
            if instance_code.any?(number)
                instance_code.insert(instance_code.index(number), "W")
                instance_code.slice!(instance_code.index(number))
                $white_circles += 1
            end
        end

        if $black_circles == 1
            if $white_circles == 0
                board.insert(1, "●".black)
                board.slice!(17)
                puts board
            elsif $white_circles == 1
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●")
                board.slice!(21)
                puts board
            elsif $white_circles == 2 
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●")
                board.slice!(21)
                board.insert(23, "●")
                board.slice!(25)
                puts board
            elsif $white_circles == 3
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●")
                board.slice!(21)
                board.insert(23, "●")
                board.slice!(25)
                board.insert(27, "●")
                board.slice!(29)
                puts board
            end
        end

        if $black_circles == 2
            if $white_circles == 0
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●".black)
                board.slice!(35)
                puts board
            elsif $white_circles == 1
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●".black)
                board.slice!(35)
                board.insert(37, "●")
                board.slice!(39)
                puts board
            elsif $white_circles == 2
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●".black)
                board.slice!(35)
                board.insert(37, "●")
                board.slice!(39)
                board.insert(41, "●")
                board.slice!(43)
                puts board
            end
        end

        if $black_circles == 3
            if $white_circles == 0
                board.insert(1, "●".black)
                board.slice!(17)
                board.insert(19, "●".black)
                board.slice!(35)
                board.insert(37, "●".black)
                board.slice!(53)
                puts board
            end
        end

        if $black_circles == 4 
            board.insert(1, "●".black)
            board.slice!(17)
            board.insert(19, "●".black)
            board.slice!(35)
            board.insert(37, "●".black)
            board.slice!(53)
            board.insert(55, "●".black)
            board.slice!(71)
            puts board
            puts "You win!"
            puts "Code was: #{$code.join}"
            game()
        end

        if $white_circles == 0 && $black_circles == 0
            puts board
        elsif $white_circles == 1 && $black_circles == 0
            board.insert(1, "●")
            board.slice!(2)
            puts board
        elsif $white_circles == 2 && $black_circles == 0
            board.insert(1, "●")
            board.slice!(2)
            board.insert(5, "●")
            board.slice!(6)
            puts board
        elsif $white_circles == 3 && $black_circles == 0
            board.insert(1, "●")
            board.slice!(2)
            board.insert(5, "●")
            board.slice!(6)
            board.insert(9, "●")
            board.slice!(10)
            puts board
        elsif $white_circles == 4 && $black_circles == 0
            board.insert(1, "●")
            board.slice!(2)
            board.insert(5, "●")
            board.slice!(6)
            board.insert(9, "●")
            board.slice!(10)
            board.insert(13, "●")
            board.slice!(14)
            puts board
        end
    else
        puts "ERROR"
        guess()
    end
end

def game
    random_code_generator()
    puts "Mastermind".yellow
    puts "\nYou have to guess the computer's code in order to win.\nThe code is compiled of 4 numbers 1 through 6.".light_blue
    puts "The code can have multiple of the same numbers e.g.('1213 or '4444').".light_blue
    puts "Each time you guess, you will see a board that shows how close your guess is.".light_blue
    puts "If a number is in the code and in the correct spot, a black circle will appear in the board.".light_blue
    puts "If a number is in the code but not in the correct spot, a white circle will appear in the board.\n\n\n".light_blue
    puts "You have 12 chances to guess the code."
    for a in 1..12 do
        puts "Round #{a}"
        guess()
    end
    puts "You lost."
    puts "Code was: #{$code.join}"
    game()
end

game()