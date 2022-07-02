def ceasar_cipher(str, shift)
    newstr = ""
    str.each_char do |letter|
        ascii = letter.ord
        if (ascii >=65 && ascii <= 90)
            ascii += shift
            if (ascii > 90)
                ascii -= 26
            elsif (ascii < 65)
                ascii +=26
            end
        elsif (ascii >=97 && ascii <= 122)
            ascii += shift
            if (ascii > 122)
                ascii -= 26
            elsif (ascii < 97)
                ascii += 26
            end
        end
        newstr.insert(-1,ascii.chr)
    end
    puts newstr
end

ceasar_cipher("What a string!", 5)