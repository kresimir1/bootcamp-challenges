require_relative "../../lib/airplane"

describe Airplane do
  let (:my_plane) {Airplane.new("cesna", 10, 150, 70)}
  describe "#initialization" do
    it 'should read back the type of the airplane' do
      expect(my_plane.type).to eq("cesna")
    end
    it 'should read back the wing load of the airplane' do
      expect(my_plane.wing_loading).to eq(10)
    end
    it 'should read back the horsepower of the airplane' do
      expect(my_plane.horsepower).to eq(150)
    end
    it 'should read back the amount of fuel' do
      expect(my_plane.fuel).to eq(70)
    end
  end

  describe "#start" do
    it "should start the airplane" do
      expect(my_plane.start).to eq("airplane started")
    end
    it "should let us know if there is not enough fuel" do
      my_plane = Airplane.new("cesna", 10, 150, 10)
      expect(my_plane.start).to eq("not enough fuel to perform the action")
    end
    it "should let us know if the airplane is already started" do
      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
    end
  end

  describe "#takeoff" do
    it "should let us know if the plane is not started" do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end
    it "should launch the plane once it is started" do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
    it "should let us know if there is not enough fuel" do
      my_plane = Airplane.new("cesna", 10, 150, 30)
      my_plane.start
      expect(my_plane.takeoff).to eq("not enough fuel to perform the action")
    end
  end

  describe "#land" do
    it "should let us know if the plane was not started" do
      expect(my_plane.land).to eq("airplane not started, please start")
    end
    it "should let us know if the plane was started but did not take off" do
      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")
    end
    it "should let us know if there is not enough fuel" do
      my_plane = Airplane.new("cesna", 10, 150, 50)
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("not enough fuel to perform the action")
    end
    it "should land the plane if it was already in the air" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end

  end

end
