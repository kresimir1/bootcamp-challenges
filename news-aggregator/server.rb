require 'sinatra'
require 'pry'


get "/articles" do
  @articles = File.readlines("articles.csv")
  @urls = File.readlines("urls.csv")
  @descriptions = File.readlines("descriptions.csv")
  erb :index
end

get "/articles/new" do
  article = params[:article]
  aritcle_url = params[:article_url]
  article_description = params[:article_description]
  erb :article_submission
end

get "/articles/:article_url" do
  aritcle_url = params[:article_url]
  erb :index
end



post "/articles/new" do
  article = params[:article]
  article_url = params[:article_url]
  article_description = params[:article_description]


  File.open("articles.csv", "a") do |file|
    file.puts(article)
  end

  File.open("urls.csv", "a") do |file|
    file.puts(article_url)
  end

  File.open("descriptions.csv", "a") do |file|
    file.puts(article_description)
  end

  redirect "/articles"
end
