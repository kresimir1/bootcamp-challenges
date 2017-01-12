require "nokogiri"
require "pry"
require 'net/http'
# Your code, here.

# uri = URI('http://launch-academy-chat.herokuapp.com/messages')
# Net::HTTP.get(uri)
messages = <<-HTML

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Messages</title>
  <link rel="stylesheet" type="text/css" href="/pure.css">
  <link rel="stylesheet" type="text/css" href="/main.css">
</head>

<body>
  <div class="header">
  <div class="pure-g">
    <div class="pure-u-1-8"></div>

    <div class="pure-u-3-4">
      <div class="home-menu pure-menu pure-menu-horizontal">
        <a class="pure-menu-heading" href="/">Messages</a>

        <ul class="pure-menu-list">
          <li class="pure-menu-item"><a href="/messages" class="pure-menu-link">View Messages</a></li>
          <li class="pure-menu-item"><a href="/messages/new" class="pure-menu-link">New Message</a></li>
          <li class="pure-menu-item"></li>
        </ul>
      </div>
    </div>

    <div class="pure-u-1-8"></div>
  </div>
</div>


  <div class="pure-g">
    <div class="pure-u-1-8"></div>

    <div class="pure-u-3-4">
      <h1>Messages</h1>

<div class="pure-g">
  <div class="pure-u-1-4 created_at">
    <strong>Created At</strong>
  </div>

  <div class="pure-u-1-2 content">
    <strong>Content</strong>
  </div>
</div>

  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-04 14:00:32
    </div>
    <div class="pure-u-1-2 content">
      test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-02 23:11:11
    </div>
    <div class="pure-u-1-2 content">
      Incredible! Thanks!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-02 23:07:21
    </div>
    <div class="pure-u-1-2 content">
      I am posting this at 2016-08-02 19:07:21 -0400
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-02 22:31:40
    </div>
    <div class="pure-u-1-2 content">
      I am posting this at 2016-08-02 18:31:40 -0400
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-02 22:24:28
    </div>
    <div class="pure-u-1-2 content">
      This is a message!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-08-01 22:38:21
    </div>
    <div class="pure-u-1-2 content">
      Look! Someone made a video with all the Phase 7 answers in it!! https://www.youtube.com/watch?v=dQw4w9WgXcQ
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-28 17:14:52
    </div>
    <div class="pure-u-1-2 content">
      I don't understand the question and I won't respond to it.
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-28 17:09:56
    </div>
    <div class="pure-u-1-2 content">
      Let's go!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-27 15:49:58
    </div>
    <div class="pure-u-1-2 content">
      Sent using HTTParty
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-27 15:38:28
    </div>
    <div class="pure-u-1-2 content">
      test
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-15 16:41:28
    </div>
    <div class="pure-u-1-2 content">
      My Father gave me a small loan of a million dollars... - The Don
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-15 16:38:15
    </div>
    <div class="pure-u-1-2 content">
      How Can Mirrors Be Real If Our Eyes Aren't Real? -Jaden Smith
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-15 16:32:18
    </div>
    <div class="pure-u-1-2 content">
      Testing 1 2 3 Testing A B C
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-15 03:54:02
    </div>
    <div class="pure-u-1-2 content">
      Life is like riding a bicycle. To keep your balance, you must keep moving - Albert Einstein
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 01:41:42
    </div>
    <div class="pure-u-1-2 content">
      Yall come back now!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 01:40:58
    </div>
    <div class="pure-u-1-2 content">
      Yall come back now!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 01:40:46
    </div>
    <div class="pure-u-1-2 content">
      Yall come back now!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 01:38:48
    </div>
    <div class="pure-u-1-2 content">
      Yall come back now!
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 01:06:06
    </div>
    <div class="pure-u-1-2 content">
      Here is the content
    </div>
  </div>
  <div class="pure-g">
    <div class="pure-u-1-4 created_at">
      2016-07-12 00:49:21
    </div>
    <div class="pure-u-1-2 content">
      Hello World
    </div>
  </div>

    </div>

    <div class="pure-u-1-8"></div>
  </div>
</body>
</html>
HTML

html = Nokogiri::HTML(messages)
html.css("div.pure-g").each do |message|
  puts message.text
end
