class Temperature
  def initialize(t)
    @temp_hash = t
  end

  def self.from_celsius(t)
    new({:c => t})
  end

  def self.from_fahrenheit(t)
    new({:f => t})
  end

  def in_fahrenheit
    if @temp_hash.has_key?(:c)
      ((@temp_hash[:c] / (5.0/9.0)) + 32)
    else
      @temp_hash[:f]
    end
  end

  def in_celsius
    if @temp_hash.has_key? :f
      (@temp_hash[:f] - 32) * (5.0/9.0)
    else
      @temp_hash[:c]
    end
  end

  class << self
    def ftoc(fahrenheit)
      (fahrenheit - 32) * (5.0/9.0)
    end

    def ctof(celsius)
      ((celsius / (5.0/9.0)) + 32)
    end
  end
end

class Celsius < Temperature
  def initialize(t)
    super({:c => t})
  end
end

class Fahrenheit < Temperature
  def initialize(t)
    super({:f => t})
  end
end
