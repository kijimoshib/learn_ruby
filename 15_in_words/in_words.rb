module Num_to_Words
  def in_words
    number = self
    return "zero" if number == 0
    num_str = ""

    one_str_array  = %w(one two three four five six seven eight nine)
    ten_str_array  = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
    teen_str_array = %w(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen ten)

    big_num_map = {1_000_000_000_000 => "trillion",
                   1_000_000_000     => "billion",
                   1_000_000         => "million",
                   1_000             => "thousand",
                   100               => "hundred"}

    big_num_map.each_pair do |big_num, big_num_name|
      if number > (big_num-1)
        over_big_num = number / big_num
        if over_big_num > 0
          num_str << "#{over_big_num.in_words} #{big_num_name}"
          number -= (over_big_num * big_num)
          num_str << " " if number > 0
        end
      end
    end

    case number
    when 1..9 then
      num_str << one_str_array[number - 1]
    when 10..19 then
      num_str << teen_str_array[number % 10 - 1]
    when 20..99
      num_str << ten_str_array[number / 10 - 1]
      num_str << " " + (number % 10).in_words if (number % 10) != 0
    else
    end
    num_str
  end
end

class Fixnum
  include Num_to_Words
end

class Bignum
  include Num_to_Words
end
