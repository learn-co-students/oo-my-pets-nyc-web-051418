require 'Pry'

class Owner

  attr_accessor :name, :count, :pets
  attr_reader   :species

  @@count = 0
  ALL = []

  def initialize(name, species = "human")
    @name    = name
    @species = species
    ALL << self
    @@count += 1

    @pets = { :fishes => [],
              :dogs   => [],
              :cats   => [] }
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
      pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
      pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
      pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |species, animals|
         animals.each do |animal|
           animal.mood = "nervous"
         end
         animals.clear
       end
     end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
 

  def self.all
    ALL
  end

end
# Pry.start
