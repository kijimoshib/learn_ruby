class Book

  LOWER = %w[a an and or of in the over]

  attr_reader :title

  def title=(str)
    @title = Book.make_cap(str)
  end

  private

  def self.make_cap(s)
    cap_arr = []

    s.split(" ").each do |word|
      cap_arr << (LOWER.member?(word) ? word : word.capitalize)
    end

    cap_arr[0].capitalize!
    cap_arr.join(" ")
  end
end
