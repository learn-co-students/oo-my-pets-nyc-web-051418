class Owner
attr_reader :species
attr_accessor :name, :pets

  ALL = []

  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    ALL << self
  end

  def self.all # This is a class method not an instance methods
    ALL
  end

  def self.count
    ALL.count
  end

  def self.reset_all
    ALL.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |species, species_array|
      species_array.each {|pet| pet.mood = "nervous"}
      species_array.clear
    end
  end

  def list_pets
    num_fishes = @pets[:fishes].length
    num_dogs = @pets[:dogs].length
    num_cats = @pets[:cats].length
    "I have #{num_fishes} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end
end
