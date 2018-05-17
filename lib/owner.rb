require 'pry'

class Owner

    attr_accessor :pets, :mood, :name
    attr_reader :species
    #attr_writer

    @@owners = []

    def initialize(species)
      @pets = {fishes: [], cats: [], dogs: []}
      @@owners << self
      @species = species
      @name = name

    end

    def buy_cat (name)
      @pets[:cats] << Cat.new(name)
    end

    def buy_dog (name)
      @pets[:dogs] << Dog.new(name)
    end

    def buy_fish (name)
      @pets[:fishes] << Fish.new(name)
    end

    def self.all
      @@owners
    end

    def self.reset_all
      @@owners.clear
    end

    def self.count
      @@owners.length
    end

    def say_species
      "I am a #{@species}."
    end

    def walk_dogs
      @pets[:dogs].map {|individual| individual.mood = "happy"}


    end

    def play_with_cats
      @pets[:cats].map {|individual| individual.mood = "happy"}


    end

    def feed_fish
      @pets[:fishes].map {|individual| individual.mood = "happy"}


    end

    def sell_pets
        @pets.each do |key, value|
          value.map do |individual|
            individual.mood = "nervous"
          end
        end
        @pets.clear

    end


    def list_pets
        "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
    end
end
