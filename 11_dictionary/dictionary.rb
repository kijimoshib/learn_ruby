class Dictionary

  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(value)
    value.class == String ?
      @entries[value] = nil : @entries.merge!(value)
  end

  def find(finding_word)
    matched_pairs = {}
    @entries.keys.grep(/^#{finding_word}/).each do |key|
      matched_pairs[key] = @entries[key]
    end
    matched_pairs
  end

  def printable
    print_array = []
    @entries.map do |entry|
      print_array << "[%s] \"%s\"" %
        [entry.first, entry.last]
    end
    print_array.sort.join("\n")
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    @entries.keys.include? word
  end
end
