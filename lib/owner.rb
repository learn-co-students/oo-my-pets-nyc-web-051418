class Owner
  attr_reader :species
  attr_accessor :pets, :name
  @@all =[]
  @@count = 0

  def initialize(name, species = "human")
    @name = name
    @species = species
    #hash of array of pets, hash keys are noted
    @pets = {fishes:[], cats:[], dogs:[]}
    @@all << self # keeps track of owners on initialize
    @@count += 1 # keeps count of how many owners been created
  end

  def self.all #class method owners are stored in class constant @@all array
    @@all
  end

  def self.count #class method count of how many owners been created
    @@count
  end

  def self.reset_all
    #class method rests owner and count of owner
    @@all = []
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    #places new fish in pets hash under fish key with name
    @pets[:fishes] << Fish.new(name)

  end

  def buy_dog(name)
    #places new fish in pets hash under fish key with name
    @pets[:dogs] << Dog.new(name)
  end

  def buy_cat(name)
    #places new cat in pets hash under cat key with name
    @pets[:cats] << Cat.new(name)
  end

  def walk_dogs
    @pets[:dogs].map {|chewie| chewie.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map {|bagends| bagends.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|froto| froto.mood = "happy"}
  end
  def sell_pets
    @pets.each do |key, value|
      value.map do |animals|
        animals.mood = "nervous"
      end
    end
      @pets = {fishes:[], cats:[], dogs:[]}
  end

  def list_pets
    pet_list = @pets.map {|keys, values| values.length}
    "I have #{pet_list[0]} fish, #{pet_list[2]} dog(s), and #{pet_list[1]} cat(s)."
  end
end
