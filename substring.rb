def substrings(input, dictionary)
    words = input.downcase.split(/\W+/)
    result = Hash.new(0)
    words.each do |word|
        dictionary.each do |dictWord|
            if word.include?(dictWord)
                result[dictWord] += 1
            end
        end
    end
    puts result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)