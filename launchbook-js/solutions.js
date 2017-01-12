// Exercise: Find the top navbar by query for the element type, which is <nav>.
document.getElementsByTagName("nav")[0];
// Exercise: Find the sidebar on the right by using it's id.
document.getElementById('sidebar-right');
// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
document.getElementsByClassName('pages')[0];
document.getElementsByClassName('groups')[0];
// Exercise: Find all of the comments on the page.
document.getElementsByClassName('comments');
// Exercise: Find the first comment on the page.
document.getElementsByClassName('comments')[0];
// Exercise: Find the last comment on the page.
var comments = document.getElementsByClassName('comments');
var lastCommentIndex = comments.length - 1;
comments[lastCommentIndex];
// Exercise: Find the fourth comment on the page.
document.getElementsByClassName('comments')[3];
// Exercise: Find one of the ads in the sidebar and hide them.
var ads = document.getElementsByClassName('ads')[0];
ads.style.visibility = "hidden";
// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.
var ads = document.getElementsByClassName('ads')[0];
ads.style.visibility = "visible";
// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.
var ads = document.getElementsByClassName('ads')[0];
var adSlot = ads.getElementsByClassName('ad-slot')[0];
var img = adSlot.getElementsByTagName('img')[0]
img.setAttribute('src', img.src = "http://placebear.com/200/300");
// Exercise: Find Sam's post and change it's text to something incredible.
var posts = document.getElementsByClassName('posts')[0];
var postMedia = posts.getElementsByClassName('post media')[3];
var mediaBody = postMedia.getElementsByClassName('media-body')[0];
var text = mediaBody.getElementsByTagName('p')[0];
text.innerHTML = 'It is realy incredible if I get this to work';

// Exercise: Find the first post and add the .post-liked class to it.
var posts = document.getElementsByClassName('posts')[0];
var postMedia= posts.getElementsByClassName('post media')[0];
postMedia.className = postMedia.className + " post-liked ";
// Exercise: Find the second post and remove the .post-liked class.
var posts = document.getElementsByClassName('posts')[0];
var postMedia= posts.getElementsByClassName('post post-liked media')[1];
postMedia.classList.remove('post-liked');
