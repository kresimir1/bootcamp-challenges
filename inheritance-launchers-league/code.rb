class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero

  def speed_in_mph
    super * 1000
  end
end

class Brawler < SuperHero

  def health
    super * 20
  end
end

class Detective < SuperHero
  def weakness
    @secret_identity
  end

  def speed_in_mph
    super / 6
  end
end

class Demigod < SuperHero
  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades < SuperHero
  def species
    "Alien"
  end

  def psychic?
    true
  end

  def home
    "Venus"
  end
end

class WaterGuy < SuperHero
  def fans_per_thousand
    5
  end

  def home
    "Earth's Oceans"
  end

  def psychic?
    true
  end
require 'pry'
binding pry
end
