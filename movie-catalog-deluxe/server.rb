require "sinatra"
require "pg"
require 'pry'

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/actors" do
  @actors = db_connection {|conn| conn.exec("SELECT name, id FROM actors ORDER BY actors.name")}
  erb :'actors/index'
end

get "/actors/:id" do
  @id = params[:id]
  @actor_info = db_connection {|conn| conn.exec("
  SELECT actors.name, movies.title, cast_members.movie_id, cast_members.character
    FROM cast_members
    JOIN actors ON (actors.id = cast_members.actor_id)
    JOIN movies ON (movies.id = cast_members.movie_id)
    WHERE actors.id = '#{@id}'
    ORDER BY movies.year")}

  erb :'actors/show'
end

get "/movies" do
  @movies = db_connection {|conn| conn.exec("
    SELECT movies.id, movies.title, movies.year, movies.rating, genres.name AS genre, studios.name AS studio
      FROM movies
      JOIN genres ON (genres.id = movies.genre_id)
      LEFT OUTER JOIN studios ON (studios.id = movies.studio_id)
      ORDER BY movies.title
    ")}

  erb :'movies/index'
end

get "/movies/:id" do
  @movie_id = params[:id]
  @movies_info = db_connection {|conn| conn.exec("
  SELECT movies.title, movies.year, movies.rating, genres.name AS genre, studios.name AS studio, actors.name, cast_members.actor_id , cast_members.character
    FROM cast_members
    JOIN actors ON (actors.id = cast_members.actor_id)
    JOIN movies ON (movies.id = cast_members.movie_id)
    JOIN studios ON (studios.id = movies.studio_id)
    JOIN genres ON (genres.id = movies.genre_id)
    WHERE movies.id = '#{@movie_id}'
    ORDER BY actors.name")}

  erb :'movies/show'
end
