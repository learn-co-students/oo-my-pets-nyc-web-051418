require 'pry'
class Owner
  attr_accessor :owner

  @@all = []

  def initialize(owner)
    @owner = owner
    @@all << self
  end
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end
#  binding.pry
end
