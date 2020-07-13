puts "what string would you like to encrypt"
    string = gets.chomp
    string.upcase!

values = string.split('').map(&:ord)

new_values = values.map do |n| 
  if n >= 65 && n <= 87 
    print (n + 3).chr
  elsif n == 90 
    print (n - 25).chr
  elsif n == 89
    print (n - 24).chr
  elsif n == 88 
    print (n - 23).chr
  else 
    print n.chr
  end
end
    


 
   