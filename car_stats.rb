class CarStats
  # TODO
  def initialize
    @cars = []
  end

  def self.histogram(array)
    cars_hash = Hash.new(0)
    array.each { |car| cars_hash[car.color] += 1 }
    cars_hash
  end

  def self.calc_top_color(array)
    histogram(array).max_by { |color, quantity| quantity }.first
  end


  def self.calc_bottom_color(array)
    histogram(array).min_by { |color, quantity| quantity }.first
  end
end
