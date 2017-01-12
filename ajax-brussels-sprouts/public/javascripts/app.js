$('#get-dish').on('click', function(event) {
  event.preventDefault();
  var request = $.ajax({
   method: "GET",
   url: "/dishes/random.json"
 });


  request.done(function(data) { alert(data["dishes"]); });
});
