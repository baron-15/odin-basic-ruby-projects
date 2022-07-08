class Master
    def initialize(username)
        @username = username
        @answerList = Array.new(4)
        @guessList = Array.new(4)
    end 

    def pick()
        puts
        puts "Do you want to make(M) or guess(G)?"
        reply = gets.chomp
        puts
        if reply == "M"
            puts "#{@username} will make."
            make()
            compGuess()
        elsif reply == "G"
            puts "#{@username} will guess."
            compMakeInit()
            guess()
        else
            puts "Invalid answer."
            pick()
        end
    end

    def compMakeInit()
        @answerString = ''
        for i in 0..3
            @answerList[i] = rand(1..6)
            @answerString += @answerList[i].to_s
        end
    end
    
    def guess()
        puts "Please input your 4-digit guess of 1 to 6."
        userGuess = gets.chomp.split('')
        if userGuess.count != 4
            puts "Not a 4-digit guess."
            guess()
        end
        userGuess.each_with_index do |c, index|
            @guessList[index]= c.to_i
            if !(c.to_i.between?(1,6))
                puts "Invalid guess at digit #{strCount}."
                guess()
            end
        end
        if judge()
            guessWin()
        else
            puts
            puts "Computer's answer is #{@answerString}."
            puts "Number of colored pegs: #{@coloredPeg}"
            puts "Number of white pegs: #{@whitePeg}"
            puts
            guess()
        end
    end

    def judge()
        processGuessList = @guessList.map do |e| e.dup end
        puts "The guess list is #{processGuessList.inspect}"
        processAnswerList = @answerList.map do |e| e.dup end
        puts "The answer list is #{processAnswerList.inspect}"
        @coloredPeg = 0
        @whitePeg = 0
        if @answerList == @guessList
            return true
        end
        for sameOrder in 0..3
            if (processGuessList[sameOrder] == processAnswerList[sameOrder])
                @coloredPeg +=1
                processGuessList[sameOrder] = 'x'
                processAnswerList[sameOrder] = 'y'
            end
        end
        for guessOrder in 0..3
            for ansOrder in 0..3
                if processGuessList[guessOrder] == processAnswerList[ansOrder]
                    @whitePeg +=1
                    processGuessList[guessOrder] = 'j'
                    processAnswerList[ansOrder] = 'k'
                end
            end
        end
        return false
    end
end

def make()
    @guessCount = 0
    puts
    puts "Please input your 4-digit answer of 1 to 6. "
    @answerString = gets.chomp
    userMake = @answerString.split('')
    strCount = 0
    @answerList = []
    userMake.each do |c|
        strCount +=1
        @answerList.push(c.to_i)
        if !(c.to_i.between?(1,6))
            puts "Invalid make at digit #{strCount}."
            make()
        end
    end
    if strCount != 4
        puts "Not a 4-digit make."
        make()
    end
    compGuess()
end

def compGuess()
    @guessString = ''
    for guess1 in 1..6
        for guess2 in 1..6
            for guess3 in 1..6
                for guess4 in 1..6
                    @guessList[0] = guess1
                    @guessList[1] = guess2
                    @guessList[2] = guess3
                    @guessList[3] = guess4
                    @guessString = @guessList.join("")
                    @guessCount += 1
                    puts "Judging."
                    if judge()
                        compWin()
                        return
                    end
                end
            end
        end
    end
end

#    Advanced algorithm: for future fun
#    guessCount = 0
#    @guessList = [1, 2, 3, 4]
#   @guessHistory = []
#    @coloredPegHistory = 0
#    @whitePegHistory = 0
#    while @guessList != @answerList do
#        @guessListBackup = @guessList.map do |e| e.dup end
#        worseGuess = 0
#
#        judge()
#        if ((@coloredPeg < @coloredPegHistory) || (@whitePeg < @whitePegHistory))
#            worseGuess = 1
#        end
#    end
##

def guessWin
    puts "Congrats! you guessed it right!"
    pick()
end

def compWin
    puts "NOOOO! Computer guessed it right!"
    puts " The answer is #{@guessString}. Computer got it right in #{@guessCount} attempts."
    pick()
end

def welcome
    puts
    puts "Welcome to Mastermind"
    puts "Please enter your name."
    name = gets.chomp
    master = Master.new(name)
    master.pick()

end

welcome()