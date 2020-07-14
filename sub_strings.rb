dictionary = ["below","down","go","going","horn","how","howdy","it","i","low", "own","part","partner","sit"]

def substrings(string, dictionary)
    result = Hash.new(0)
    string = string.downcase.split(" ")
        string.each do |keyword|    
        dictionary.each do |word|
            if keyword.include?(word)
            result[word] += 1
        end
    end
end
    puts result
end
substrings("Howdy partner, sit down! How's it going?", dictionary)