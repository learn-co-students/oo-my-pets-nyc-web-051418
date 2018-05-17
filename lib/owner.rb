require 'pry'

class Owner

    attr_accessor :name, :pets
    attr_reader :species

    @@all = []
    @@count = 0

    def initialize(name=nil, species="human")
      @name = name
      @species = species
      @pets = {fishes:[], cats:[], dogs:[]}
      @@all << self
      @@count += 1
    end

    def self.reset_all
      @@all = []
      @@count = 0
    end

    def self.count
      @@count
    end

    def self.all
      @@all
    end

    def buy_fish(name)
      @pets[:fishes] << Fish.new(name)
    end

    def buy_cat(name)
      @pets[:cats] << Cat.new(name)
    end

    def buy_dog(name)
      @pets[:dogs] << Dog.new(name)
    end

    def walk_dogs
      @pets[:dogs].map do |dog|
        dog.mood = "happy"
      end
    end

    def play_with_cats
      @pets[:cats].map do |cat|
        cat.mood = "happy"
      end
    end

    def feed_fish
      @pets[:fishes].map do |fish|
        fish.mood = "happy"
      end
    end

    def sell_pets
      @pets.each do |key, value|
        value.map do |pets|
          pets.mood = "nervous"
        end
      end
      @pets = {fishes:[], cats:[], dogs:[]}
    end

    def say_species
       "I am a #{@species}."
    end

    def list_pets
      list = @pets.map do |key, value|
        value.length
      end
      "I have #{list[0]} fish, #{list[2]} dog(s), and #{list[1]} cat(s)."
    end
end

# Pry.start
