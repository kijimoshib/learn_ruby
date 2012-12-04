require "time"
class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    Time.at(@seconds).utc.strftime('%T')
  end

  #def time_string
  #  time_values = {}
  #  time_values[:hours] = seconds/3600
  #  time_values[:minutes] = (seconds%3600)/60
  #  time_values[:seconds] = (seconds%3600)%60
  #  "%02d:%02d:%02d" % time_values.values
  #end

end
