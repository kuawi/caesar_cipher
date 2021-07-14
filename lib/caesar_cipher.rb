require "pry"

def ignore_char?(char_code)
  return true unless char_code.between?("a".ord, "z".ord) || char_code.between?("A".ord, "Z".ord)
  false
end

def shift_char(char_code, shift_factor)
  char_code_shifted = char_code + shift_factor
  char_code_wrapped =  wrap_char_code(char_code_shifted)
  char_code_wrapped.chr
end

#for this to work with negative shift_factor it would have to wrap around a-z and also around A-Z but a big absolute value of shift_factor may cause a change in the capitalization of the final result, to avoid this and aso make the code simpler we could store "caps state" at the start then process everything in lowcase, and modifying caps at the end if necesary
def wrap_char_code(char_code_shifted)
  if char_code_shifted.between?("a".ord, "z".ord) || char_code_shifted.between?("A".ord, "Z".ord)
    return char_code_shifted
  else
    return char_code_shifted -= ("z".ord - "a".ord) # char_code_shifted -= 25
  end
end

def caesar_cipher(string, shift_factor)
  #binding.pry
  string.split("").map do |char|
    char_code = char.ord
    if ignore_char?(char_code) then char
    else
      shift_char(char_code, shift_factor)
    end
  end.join
end

puts caesar_cipher("What a string!", 5)
#puts caesar_cipher(caesar_cipher("What a string!", 5), -5)