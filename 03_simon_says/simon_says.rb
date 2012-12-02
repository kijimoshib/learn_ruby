def echo(str)
  str
end

def titleize(str)
  phrase = str.split.map do |word|
    %w(and over the).member?(word) ?
      word : word.capitalize
  end
  phrase[0].capitalize!
  phrase.join(" ")
end

def start_of_word(str, n)
  str.slice(0, n)
end

def first_word(str)
  str.split.first
end

def shout(str)
  str.upcase
end

def repeat(str, replay = 2)
  ([str] * replay).join(" ")
end
