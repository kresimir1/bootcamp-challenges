

$('#add').on('submit', function(event) {
  event.preventDefault();
  var item = $('#grocery_name').val();

  var request = $.ajax({
   method: "GET",
   url: "/groceries"
 });


  request.done(function() {
    if (item.replace(/\s/g,"") == "") {
      alert("You can not submit an empty form!!!")
    }
    else {
       $("#grocery-list").append("<li>" + item + "</li>");
    };
   });
});

$('#remove').click(function(event) {
  event.preventDefault();

  id = event.target.id;
  element = event.target;
  element.closest('li').remove();

  var request = $.ajax({
   method: "DELETE",
   url: "/groceries" + id
 });


  ;
  });
