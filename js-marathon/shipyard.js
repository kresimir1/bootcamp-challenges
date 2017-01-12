// YOUR CODE GOES HERE

function launchpad(ship){
  console.log("Mama I am going to space!!!!" + "\nOur spaceship is named:" + ourShip.name);
  ourShip.loadCrew(crewMembers);
  console.log("Our captain for this flight is: ");
  ourShip.captain(crewMembers);
  console.log(rocket.addFuel(3));
  console.log(rocket.fire());
  ourShip.mountPropulsion(rocket);
  ourShip.takeoff();
}


function Ship(name){
  this.name = name;
  this.crew = [];
  this.loadCrew = function(crewMembers){
    for(var i = 0; i < crewMembers.length; i++){
      this.crew.push(crewMembers[i]);
      console.log("Welcome aboard " + crewMembers[i].name + "!!!");
    }
  };
  this.captain = function(crewMembers){
    console.log(crewMembers[random_index].name);
  }
  this.propulsion = null;
  this.mountPropulsion = function(object){
    Ship.propulsion = object;
    console.log("Propulsion mounted");
  }
  this.takeoff = function(){
    Ship.propulsion.fire;
    if (Ship.propulsion.fire === false){
      console.log("Takeoff unsucesfull...");}
    if (Ship.propulsion.fire === true){
      console.log("Taking ooooooooooooooooooooofffffffff....");}
  }
}


var ourShip = new Ship("Yellow Johhny");

var crewNames = ["Kreso", "Lilly", "Ashley", "Tali", "Micah"];

function CrewMember(name, trained = false){
  this.name = name;
  this.trained = trained;

}


function trainCrew(arr1){
  var arr2 = []
  for(var i = 0; i < arr1.length; i++){
    arr2.push(new CrewMember(arr1[i], true));
  }
  return arr2
}

var crewMembers = trainCrew(crewNames);

var index = crewMembers.length;
var random_index = Math.floor(Math.random() * index);

// step 7
var rocket = {
  fuel : 0,
  addFuel : function(int){
    rocket.fuel = rocket.fuel + int;
    return ("Adding fuel....new fuel ammunt is: " + rocket.fuel);},
  fire : function(){
    if (rocket.fuel === 0) {
      return ("Engines failed to fire. No fuel alarm!!!");}
    if (rocket.fuel >= 1){
      rocket.fuel = rocket.fuel -1;
      console.log("Engines have been fired");
      console.log("Current fuel:" + rocket.fuel);
      return true;
    }
  }
}

var shipNames = ["Enterprise", "Space Titanic", "Galeb", "Yellow Johny"];
function Fleet(name){
  this.name = name;
  this.ships = [];
  this.build = function(shipNames){
    for(var i = 0; i < shipNames.length; i++){
      this.ships.push(new Ship(shipNames[i]));
    }
    return this.ships;
  }
}

// console.log(rocket.fire());
var kresoFleet = new Fleet("My fleet")
console.log(launchpad(ourShip));
console.log("Proud to present my fleet:");
console.log(kresoFleet.build(shipNames));
