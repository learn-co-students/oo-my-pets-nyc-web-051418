require 'pry'
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @pets = {fishes: [], cats: [], dogs: []}
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(pet_name)
    self.pets[:fishes] << Fish.new(pet_name)
  end

  def buy_cat(pet_name)
    self.pets[:cats] << Cat.new(pet_name)
  end

  def buy_dog(pet_name)
    self.pets[:dogs] << Dog.new(pet_name)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |pet, value|
      value.each do |name|
        name.mood = "nervous"
      end
    end
    self.pets = {}
  end

  def list_pets
    collect = []
    self.pets.each do |pet, value|
      collect << "#{value.length}"
    end
    collect
    "I have #{collect[0]} fish, #{collect[2]} dog(s), and #{collect[1]} cat(s)."
  end

end
