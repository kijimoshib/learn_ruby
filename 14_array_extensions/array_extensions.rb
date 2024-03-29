class Array
  def sum
    self.inject(0, :+)
  end

  def square
    map { |n| n*n }
  end

  def square!
    map! { |n| n*n }
  end
end
