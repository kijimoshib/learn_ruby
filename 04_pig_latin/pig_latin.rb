def translateword(word)
  found = -> key { Regexp.last_match(key) }
  res   = case word
          when /^[aeiouy]/
            word + "ay"
          when /^(?<ex_qu>qu+)(?<tail>.*)/
            found[:tail] + found[:ex_qu] + "ay"
          when /(?<consonant>[^aeiouy]+)(?<tail>.*)/
            found[:tail] + found[:consonant] + "ay"
          else
            word
          end
  word =~ /^[A-Z]/ ? res.capitalize : res
end

def translate(phrase)
  piged_array = []
  punct       = /(\.|\?|!|\s|,|:)/
  words_array = phrase.split(punct)
  words_array.each do |word|
    if word[punct]
      piged_array << word
    else
      piged_array << translateword(word)
    end
  end
  piged_array.join("")
end
