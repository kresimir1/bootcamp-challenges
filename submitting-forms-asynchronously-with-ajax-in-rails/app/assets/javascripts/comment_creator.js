var newCommentCreator = function(commentAttributes, divId) {
  return {
    comment: commentAttributes,
    div: $(divId),
    create: function() {
      var commentCreatorObject = this;
      var request = $.ajax({
        method: "POST",
        url: "/api/v1/comments",
        data: { comment: commentCreatorObject.comment }
      });

      request.done(function() {
        commentCreatorObject.setFlash("notice", "Thank you for your input!");
        commentCreatorObject.append();
      });

      request.error(function() {
        commentCreatorObject.setFlash("error", "There was a problem with your comment.");
      });
    },
    setFlash: function(type, message) {
      $("div.flash").remove();
      var flash = $("<div>", { "class": "flash flash-" + type }).text(message);
      $("body").prepend(flash);
    },
    append: function() {
      // add the comment to the DOM
      var commentTitle = this.comment.title // $("input#comment_title").val();
      var commentBody = this.comment.content // $("textarea#comment_content").val();
      this.div.append("<h3>" + commentTitle + "</h3>");
	    this.div.append("<p>" + commentBody + "</p>");

      $("input#comment_title").val('');
      $("textarea#comment_content").val('');
    }
  }
};
