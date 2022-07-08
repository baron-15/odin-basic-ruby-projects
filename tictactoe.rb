class Tic
    def initialize(name1, name2)
        @name1 = name1
        @name2 = name2
        @turn = 1
        @piece = "X"
        @turnName = name1
        @board = Array.new(3){Array.new(3)}
        i = 0
        while i<9 do
            @row = i/3
            @column = i%3
            @board[@row][@column] = i+1
            i+=1
        end
        puts "#{@name1}: X. #{name2}: O."
    end

    def startGame()
        printboard()
        if @turn == 1
            @turnName = @name1
            @piece = "X"
        elsif @turn == -1
            @turnName = @name2
            @piece = "O"
        end
        puts "It is #{@turnName}'s turn."
        entry()
        win()
        @turn *= -1
        startGame()
    end

    def printboard()
        puts
        puts "#{@board[0][0]} #{@board[0][1]} #{@board[0][2]}"
        puts "#{@board[1][0]} #{@board[1][1]} #{@board[1][2]}"
        puts "#{@board[2][0]} #{@board[2][1]} #{@board[2][2]}"
    end

    def entry()
        pick = gets.chomp.to_i - 1
        if pick.between?(0,8)
            @row = pick/3
            @column = pick%3
            if @board[@row][@column] = pick + 1
                @board[@row][@column] = @piece
            end
        else
            puts "Invalid answer. Please try again."
            entry()
        end
    end

    def win()
        for j in 0..2
            if ((@board[j][0] == @board[j][1] && @board[j][0] == @board[j][2]) || (@board[0][j] == @board[1][j] && @board[0][j] == @board[2][j])|| (@board[0][0] == @board[1][1] && @board[0][0] == @board[2][2]) || (@board[2][0] == @board[1][1] && @board[2][0] == @board[0][2]))
                printboard()
                puts "Game over! #{@turnName} wins!"
                welcome()
            end
        end
        return false
    end



end

def welcome
    puts
    puts "Welcome to Tic Tac Toe!"
    puts "Input user 1's name"
    user1 = gets.chomp
    puts "Input user 2's name"
    user2 = gets.chomp
    tic = Tic.new(user1, user2)
    tic.startGame()
end

welcome()
