class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    planet_names = @planets.map do |planet_element|
      planet_element.name

    end
    return planet_names
  end

  def get_planet_by_name(planet_name)
    @planets.find{|planet| planet.name == planet_name}
  end

  def get_largest_planet
    @planets.max{|big_planet,planet| big_planet.diameter <=> planet.diameter}

  end

  def get_smallest_planet
    @planets.min{|small_planet,planet| small_planet.diameter <=> planet.diameter}
  end

  def get_planets_with_no_moons
    @planets.find_all{|planets| planets.number_of_moons == 0}
  end
  def get_planets_with_more_moons(number)
   number_moon = @planets.find_all{|planets| planets.number_of_moons > number}
   number_moon.map {|planet| planet.name }
  end

end
