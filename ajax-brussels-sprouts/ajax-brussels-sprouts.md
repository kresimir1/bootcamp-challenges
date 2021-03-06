## OMG. I need a random Brussels Sprout recipe STAT!

### Instructions

Ok, we have our good dishes finally after all that work in JavaScript. Now we need to display a random one to the user using AJAX!

* Update the root `app.rb` and the `public/javascripts/app.js` files so we expect the behavior in output below after clicking on `Click here for a random dish!`

### Learning Goals
* Understand the basics of AJAX
* Utilize on-click behavior to retrieve JSON data from server

### Input
* Use the following array called `dishes` to serve as your input:

```
  dishes = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]
```

### Output

If we click on `Click here for a random dish!` we should expect something like the following output:

![alt](https://s3.amazonaws.com/horizon-production/images/KHtyuZr.png)

Clicking the link again would provide another random Brussels Sprout recipe:

![alt](https://s3.amazonaws.com/horizon-production/images/tr7LGhJ.png)

### Tips
* Run bundle from your terminal to have the right dependencies installed (like the sinatra gem).
* jQuery is included. Use it to make [AJAX requests](http://api.jquery.com/jquery.ajax/).
