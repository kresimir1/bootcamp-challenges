// YOUR CODE HERE
if ( typeof window === 'undefined' ) {
  require('../src/Leaderboard');
  var expect = require('chai').expect;
}

describe ('team_info constructor', function(){

    it('should have a name, rank, number of wins and losses', function() {

      // var name = 'Cibona';
      // var rank = 1;
      // var wins = 93;
      // var losses = 3;
      var cibona = new TeamInfo('cibona', 1, 93, 3);

    expect(cibona.name).to.eql('Cibona');
    expect(cibona.wins).to.eql(93);
  });

});
