class Friend
  def greeting(whom = nil)
    "Hello#{", " + whom if whom}!"
  end
end
