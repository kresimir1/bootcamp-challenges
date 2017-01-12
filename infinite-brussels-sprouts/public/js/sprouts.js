// YOUR CODE GOES HERE
var a = 1;
$('.more-sprouts').on('click', function(event) {
  event.preventDefault();
  a = a + 1;

  var request = $.ajax({
    method: "GET",
    url: "/tweets.json?page=" + a
  });

  request.done(function(data) {
    data.forEach(function(tweet) {
      $(".tweets").append("<li class='tweet'><div class='body'>" +
      tweet['text'] + "</div><div class='user'>" + tweet['username'] + "</li>");
    });
  });
});
