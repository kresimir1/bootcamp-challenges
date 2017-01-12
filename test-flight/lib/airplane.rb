class Airplane
    attr_reader :type, :wing_loading, :horsepower, :fuel
  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_started = ""
    @state = ""
    @fuel = fuel
  end

  def start
    if @engine_started == ""
      if fuel > 20
        @fuel -= 20
        @engine_started = "airplane started"
      else
        "not enough fuel to perform the action"
      end
    else
      @engine_started = "airplane already started"
    end
  end

  def takeoff
    if @engine_started == ""
      "airplane not started, please start"
    else
      if @fuel > 20
        @fuel -= 20
        @state = "airplane launched"
      else
        "not enough fuel to perform the action"
      end
    end
  end

  def land
    if @engine_started == ""
      "airplane not started, please start"
    elsif @state == ""
      "airplane already on the ground"
    else
      if fuel > 20
        @fuel -= 20
        "airplane landed"
      else
        "not enough fuel to perform the action"
      end
    end
  end


end
