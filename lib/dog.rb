class Dog
  attr_accessor :mood #read and write
  attr_reader :name # read only

  def initialize(name)
    @name = name
    @mood = "nervous"
  end




end
