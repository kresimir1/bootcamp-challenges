One of the big benefits of Git is getting to have multiple people working on different parts of an app at once, and using an organized system to review each other's code and merge those changes together. This exercise will walk you through the workflow you'll be using in group projects and for your own future work.

# All About Git branches

Git "branches" allow you to have different "versions" of your codebase simultaneously. You can have a clean, working version of your code on your `master` branch, and then go to a new branch to work on writing a new feature. Once you're sure the new feature is working and hasn't broken anything, you can merge those changes into your `master` branch (as will be described below!).

When you have multiple people working on the same project, each person should be doing their work in their own branch. Once someone is finished with their current piece of work, they can push all their changes up to the remote repository on Github.com and make a *pull request*.

A pull request is basically something on Github that says "here are a bunch of changes to our code that I made! I would like those changes to be merged into the `master` branch so that they take effect as part of our main code base." (The phrase "pull request" can be thought of as "I am asking the owner of this project to pull in my changes".) It's a nicely-collected set of changes that your whole team can review, and together you can decide whether the changes are ready to merge into your primary code base.

# Part A: Basic Pull Request Work Flow

First of all, let's get set up. We're going to have you clone a repo and set it up on Github as if it was your own, so you can use it to practice making branches and pull requests. To get set up, follow these steps:

1. Clone the repo with the following command: `git clone https://github.com/cmkoller/pull-request-practice-repo.git`
1. `cd` into the directory that was created
1. Type `rm -rf .git`
1. Type `git init`
1. Go to Github.com and create a new remote repository on your account
1. Copy the URL of the remote repo
1. Back in the command line, type: `git remote add origin <YOUR REMOTE REPO URL>`
1. Make the first commit: `git add -A`, `git commit -m "First commit"`, `git push origin master`

When you're working on group projects, you will all clone down the same repository, but you will NOT do the steps where you delete the git folder and do `git init`. We are only doing those right now so that each one of you has your own version of this assignment to be working on!

You're now set up and ready to go! Let's get started with making our changes.

### 1. Make a branch

From here on out in your Launch Academy coding career, you will NEVER make changes directly on the `master` branch again. All your future work should be done on a branch! (...Saying "never" might be an slight exaggeration, but that's the idea anyway!)

For now, we're going to be making some changes to the Readme.

Create a new branch in which to do your work, by typing `git checkout -b update-readme`. From here on out, you can always change which branch you're looking at by typing `git checkout branch-name`. This will update the files as they are displayed in Atom to show you the version of your code as it exists on the current branch. You can see a full list of what branches you've made by typing `git branch`!

Make sure that you're on your new branch, then keep going.

### 2. Make some changes

Make some changes to the readme!

### 3. Commit your changes

`git add -A`

`git commit -m "Update the readme file"`

### 4. Push your changes to the remote repo

`git push origin update-readme`

### 5. Make the pull request

Go to Github.com, and go to the remote repo. There should be a button near the top that looks like this:

![](https://s3.amazonaws.com/horizon-production/images/BEj51wv.png)

Click it! If you don't see that button, click the link at the top of the page that says "2 branches", then click the "New pull request" button next to your branch:

![](https://s3.amazonaws.com/horizon-production/images/oqnBjl3.png)

This will bring you to a page where you are able to review all your changes, before actually creating the pull request. Here, you should update the title to make sure it's nice and descriptive, update the description to make sure your group members know what the changes you made are all about, and review each of the changes you made.

![](https://s3.amazonaws.com/horizon-production/images/zwWdpMk.png)

If you notice that anything's wrong, you can just close the page, make some new changes on the branch, commit and push them to the remote repo, and then go through this process of starting to make a pull request again!

Once you're sure that the changes are just the way you want them, click "Create pull request":

![](https://s3.amazonaws.com/horizon-production/images/2jOchwZ.png)

This will bring you to the page for your pull request - you can now copy this link and share it around with your team to show them your work!

### 6. Merge the pull request

Together with your team, you should take time to look at the changes shown in the pull request, comment on them, and make updates. If you want to make changes to the code in your pull request, you can simply make new commits on the same branch you were working on, and push them to the remote repo - they'll show up on the PR.

When you and the team are completely sure the PR is in its final form and all the changes are ready to go into master, you can merge the pull request. (Note: this is often the role of your project manager. For group projects, you will NOT be merging PRs yourself! Your mentor will be responsible for making the final decision that the code can go into `master` and merging the PR.)

To merge a PR, you can click the big green button here:

![](https://s3.amazonaws.com/horizon-production/images/vJsis8O.png)

### 7. Make sure everyone has the new version of the code on `master`

Every member of your team should now go to their local master branch and type `git pull origin master`, to make sure the local version of their code is up-to-date with the changes that you just merged into master!

# Part B: Dealing with Merge conflicts

Sometimes, you and your coworkers will end up each making different changes to the same file while you're working independently. For the most part, Git is really good at figuring out how to incorporate both your your changes automatically. However, there will be some times where Git doesn't know how to automatically merge your code - this is called a "merge conflict". In this case, Git will alert you to the problem area and you'll need to do it by hand.

### Getting set up

We are going to deliberately set up a situation in which you run into a merge conflict, for the sake of practice. The following steps are NOT good Git workflow, we're just using them to set up this particular situation!

1. Go to your master branch by typing `git checkout master`, and make sure you have the most recent version of your code by typing `git pull origin master`.
1. Make a branch like so: `git checkout -b add-pokemon-routes`
1. Open `routes.rb`. Add a new line between lines 3 and 4, and type: `resources :pokemon, only: [:index, :show]`
1. Commit and push your changes: `git add -A`, `git commit -m "Add index and show routes for pokemon"`, `git push origin add-pokemon-routes`

You have now made some changes. We are now going to simulate what would happen if your teammates had made some conflicting changes while you were doing your work!

1. I lied earlier, we are going to make a change to `master` - but JUST this once! Type `git checkout master`
1. Open `routes.rb`. Remember, since we're on a different branch the changes you made previously aren't here. Add a new line between lines 3 and 4, and type: `resources :pokemaster, expect: [:update, :edit]`
1. Type `git add -A`, `git commit -m "Add routes for pokemasters"`, `git push origin master`

Now, there are some changes on your master branch that are NOT reflected in your branch that you started. Let's fix that!

(Remember, this was all just set-up. In your normal group project work, these situations will arise naturally from your teammates creating and merging their own pull requests while you're still doing work on your own branch.)

### 1. Make your pull request like normal

Go to Github.com, and follow the steps shown in Part A to create your pull request.

### 2. Oh no, there's a merge conflict!

Once you've created your pull request, you'll see that you are unable to click the big green "Merge pull request" button:

![](https://s3.amazonaws.com/horizon-production/images/pdocPAQ.png)

This is because there are parts of your code that Git does not know how to merge into the code that exists on the `master` branch. It's up to you now to resolve those conflicts and tell Git how to put the two pieces together!

### 3. Get your local `master` branch up-to-date with the `master` branch's changes

Do the following from your local branch:

1. Type `git checkout master`
1. Make sure your master brach is up to date by typing `git pull origin master`
1. Type `git checkout add-pokemon-routes` to get back to the branch that's associated with your pull request.

### 4. Attempt to merge the current version of `master` into your branch

...by typing `git merge master`. This says, "Hey Git! I want you to take all the changes that exist on my `master` branch, and try to merge them into my current branch!" Git takes the updates to master and tries to apply them to the branch you're currently in. Your command line output should look like this:

![](https://s3.amazonaws.com/horizon-production/images/F92D4N3.png)

### 5. Analyze the terminal output to figure out what to do

For the most part, Git was able to merge the updates automatically. However, there were some situations where Git was not able to automatically merge two different versions of the same file.

The terminal output is very helpful here. For every point at which Git does not know how to merge things together automatically, it'll write: `CONFLICT (content): Merge conflict in <FILENAME>` or something similar.

Your job is now to go to each of those files listed and resolve the conflicts by hand.

### 6. Resolve merge conflicts

Let's open up the first (and only) file listed: `config/routes.rb`. It should now look like this:

![](https://s3.amazonaws.com/horizon-production/images/ajksTjU.png)

This is Git's way of expressing to you that it has these two different versions of code, and it doesn't know what to do.

All the code between `<<<<<<< HEAD` and `=======` is the version of code that YOU wrote in this branch. (`HEAD` refers to the most recent place you've been working.) All the code between `=======` and `>>>>>>> master` is the version that currently resides on the `master` branch. (Presumably your coworkers recently made some changes to this code, which Git is now trying to smush into the changes you made to the code.)

![](https://s3.amazonaws.com/horizon-production/images/p0ScI7C.png)

Your job is to take this information, and update the file such that it incorporates the important parts from BOTH versions that Git is showing you. This will take some consideration of the broader picture, about what is being accomplished in both chunks of code, and possibly some consultation with your teammates. ("What was your thought process when making these changes? Is it important that they stay exactly the same, or would ~this small change~ still work?")

In this situation, it's pretty clear to see that we want to keep BOTH lines of conflicting code that Git is showing us. Both are important to the working of the app. (At times, you'll decide you want to keep one chunk of code and complete trash the other, and sometimes you'll need to find a way to work the two sets of changes together.)

Since we want to keep both lines of codes that Git is confused about, we can simply delete the `<<<<<<< HEAD`, `=======`, and `>>>>>>> master`, making our code look like so:

![](https://s3.amazonaws.com/horizon-production/images/C5jQ2bT.png)

### 7. Commit your changes

Now that we've resolved all the merge conflicts, we can commit our changes and push them to the remote branch.

```
git add -A
git commit -m "Resolve merge conflicts"
git push origin add-pokemon-routes
```

Now, when we go back to our pull request, we should see that the PR is able to be merged! Woo!

![](https://s3.amazonaws.com/horizon-production/images/3rs2bSk.png)
