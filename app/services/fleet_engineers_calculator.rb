class FleetEngineersCalculator
  class Result
    attr_reader :fleet_engineers, :success

    def initialize(success, fleet_engineers)
      @success = success
      @fleet_engineers = fleet_engineers
    end
  end

  def self.perform(scooters, c, p)
    new(scooters, c, p).perform
  end

  def initialize(scooters, c, p)
    @scooters = scooters
    @c = c
    @p = p
  end

  def perform
    return Result.new(false, 0) unless valid?
    needed_fes = 0
    scooters.each do |scooter|
      new_scooter = substract_fleet_managers(scooter)
      needed_fes += calculate_fes(new_scooter)
    end
    Result.new(true, needed_fes)
  end

  private

  attr_reader :scooters, :p, :c

  def valid?
    return p > 0
  end

  def substract_fleet_managers(scooter)
    return scooter if c <= 0
    rest = scooter - c
    set_c(rest)
    rest
  end

  def calculate_fes(scooter)
    return 0 if scooter < 0
    (scooter.to_f / p.to_f).ceil
  end

  def set_c(rest)
    @c = if rest < 0
           rest.abs
         else
           @c = 0
         end
  end
end
