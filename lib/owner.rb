require 'pry'
class Owner
  attr_accessor :name, :pets
  @species
  @@all = []
  def initialize(name)
    @name = name
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.reset_all
    @@all = []
  end

  def species
    @speices = "human"
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    fish_array = self.pets.select do |pet_type|
      pet_type == :fishes
    end
    fish_array[:fishes] << fish
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    cat_array = self.pets.select do |pet_type|
      pet_type == :cats
    end
    cat_array[:cats] << cat
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    dog_array = self.pets.select do |pet_type|
      pet_type == :dogs
    end
    dog_array[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.map do |pet|
      pet[1].each do |curr_pet|
        curr_pet.mood = "nervous"
      end
      pet[1].clear
    end
  end

  def list_pets
    numfish, numdogs, numcats = ""
    self.pets.each_with_index do |pet_type, dex|
      if dex == 0
        numfish = pet_type[1].length
      elsif dex == 1
        numdogs = pet_type[1].length
      else
        numcats = pet_type[1].length
      end
    end
    return "I have #{numfish} fish, #{numdogs} dog(s), and #{numcats} cat(s)."
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
  end
end
