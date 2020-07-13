def caesar_cipher(str, shift=1)
  upcase_alpha = ("A".."Z").to_a
  downcase_alpha = ("a".."z").to_a
  str = str.split("")
  cipher_string = ""

  str.map do |letter|
      if letter.upcase == letter.downcase
        cipher_string += letter
      elsif letter == letter.upcase
        cipher_string += upcase_alpha[(upcase_alpha.index(letter) + shift) % 26]
      elsif letter == letter.downcase
        cipher_string += downcase_alpha[(downcase_alpha.index(letter) + shift) % 26]
      end
    end
   puts cipher_string
  end

  caesar_cipher("What a string!", 5)