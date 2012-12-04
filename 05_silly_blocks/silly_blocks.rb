def reverser
  str = yield
  str.split.map { |word| word.reverse }.join(" ")
end

def adder(ad_value = 1)
  yield + ad_value
end

def repeater(replay = 1)
  replay.times { yield }
end

