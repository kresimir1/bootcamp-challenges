// YOUR CODE HERE


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
