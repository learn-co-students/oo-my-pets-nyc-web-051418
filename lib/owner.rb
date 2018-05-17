
require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets

  ALL = []
  def initialize(species)
    @species = species
    ALL << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    ALL
  end

  def self.reset_all
    ALL.clear
  end

  def self.count
    ALL.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    @pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    @pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |pet,data|
      data.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    animals = {"fishes" => 0, "dogs" => 0, "cats" => 0}
    @pets.each do |pet,data|
      animals.each do |animal,value|
        animals[pet.to_s] = data.length
        #  binding.pry
      end
    end
    # binding.pry
    "I have #{animals["fishes"]} fish, #{animals["dogs"]} dog(s), and #{animals["cats"]} cat(s)."
  end

end
