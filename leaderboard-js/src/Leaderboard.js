var gameInfo = function() {
  return [
   {
     home_team: "Patriots",
     away_team: "Broncos",
     home_score: 7,
     away_score: 3
   },
   {
     home_team: "Broncos",
     away_team: "Colts",
     home_score: 3,
     away_score: 0
   },
   {
     home_team: "Patriots",
     away_team: "Colts",
     home_score: 11,
     away_score: 7
   },
   {
     home_team: "Steelers",
     away_team: "Patriots",
     home_score: 7,
     away_score: 21
   }
 ]
}

// YOUR CODE HERE
function TeamInfo(name, rank, wins, losses) {
  this.name = name;
  this.rank = rank;
  this.wins = wins;
  this.losses = losses;
}


var team_names = []
var winners = []
var lossers = []
for(var i = 0; i < gameInfo().length; i++){
  team_names.push(gameInfo()[i].home_team)
  team_names.push(gameInfo()[i].away_team)
  if (gameInfo()[i].home_score > gameInfo()[i].away_score) {
    winners.push(gameInfo()[i].home_team)
    lossers.push(gameInfo()[i].away_team)
  }
  else {
    lossers.push(gameInfo()[i].home_team)
    winners.push(gameInfo()[i].away_team)
  }
}
var uniq_names = Array.from(new Set(team_names));
var team_info = []
for(var i = 0; i < uniq_names.length; i++){
  team_info.push(new TeamInfo(uniq_names[i], 0, 0, 0))
  }


for(var j = 0; j < team_info.length; j++){
  for(var i = 0; i < winners.length; i++){
      if (winners[i] === team_info[j].name){
        team_info[j].wins = team_info[j].wins + 1;
      }
      if (lossers[i] === team_info[j].name){
        team_info[j].losses = team_info[j].losses + 1;
      }
  }
}

team_info.sort(function(a, b){
    return b.wins-a.wins
})
team_info.sort(function(a, b){
    return a.losses-b.losses
})

for(var i = 0; i < team_info.length; i++){
  team_info[i].rank = i + 1;
}

console.log("Teams\n " + Array(34).join("-"));
console.log("| Rank " + "  Name" + "        Wins" + "   Losses|");
for(var i = 0; i < team_info.length; i++){
  var empty_space = 15 - team_info[i].name.length;
  console.log("| " + team_info[i].rank + ".   " + team_info[i].name +
  Array(empty_space).join(" ") + team_info[i].wins +
   "      " + team_info[i].losses + "     " + "|");
}
console.log(" " +Array(34).join("-"));


var gameSum = ""
function teamSummary(name){
  for(var i = 0; i < team_info.length; i++){
      if (team_info[i].name === name) {
        var teamSum = (team_info[i].name + " - Summary:\n" + "Rank: " +
        team_info[i].rank + "\nWins: " + team_info[i].wins +
      "\nLosses: " + team_info[i].losses);
      }
  }
  for(var j = 0; j < gameInfo().length; j++){
    if (gameInfo()[j].home_team === name || gameInfo()[j].away_team === name){
      gameSum = gameSum + (gameInfo()[j].home_team + "  " +  gameInfo()[j].home_score +
      " : " + gameInfo()[j].away_score + "  " + gameInfo()[j].away_team + "\n");
    }
  }
  return (teamSum + "\nGames: \n" + gameSum)
}

console.log(teamSummary("Patriots"));
