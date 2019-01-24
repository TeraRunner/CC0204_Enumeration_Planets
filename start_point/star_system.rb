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

  def get_number_of_planets_closer_than(distance)
    number_distance= @planets.find_all{|planets| planets.distance_from_sun < distance}
    number_distance.length
  end

  def get_total_number_of_moons
    @planets.reduce(0){|sum,moons| sum += moons.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    sorted_planets = @planets.sort{|distance_1,distance_2| distance_1.distance_from_sun <=> distance_2.distance_from_sun}
    sorted_names = sorted_planets.map{|planet| planet.name}
    return sorted_names
  end

  def get_planet_names_sorted_by_size_decreasing
    sorted_planets = @planets.sort{|diameter_1,diameter_2| diameter_2.diameter <=> diameter_1.diameter}
    sorted_names = sorted_planets.map{|planet| planet.name}
    return sorted_names
  end
end
