require "sinatra"
require 'pry'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get "/" do
  if session[:computer_score].nil? && session[:player_score].nil?
    session[:computer_score] = 0
    session[:player_score] = 0
  end
  erb :layout
end


post "/" do
  session[:round] = 0
  session[:round_winner] = nil
  erb :layout
  @player_choice = params[:player_choice]
  session[:player_choice] = params[:player_choice]

  @computer = rand(3)
	if @computer == 0
  		@computer = "Rock"
	elsif @computer == 1
  		@computer = "Paper"
	else @computer = "Scissors"
	end

  case
	when @player_choice == @computer
  		session[:round_winner] = "Computer chose #{@computer}, player chose #{@player_choice}. Tie, no winner!"
      redirect "/"
      session[:round] += 1
	when (@player_choice == "Rock" && @computer == "Paper") ||
		(@player_choice == "Paper" && @computer == "Scissors") ||
  		(@player_choice == "Scissors" && @computer == "Rock")
  		session[:round_winner] = "Computer chose #{@computer}, player chose #{@player_choice}, computer wins!"
        session[:computer_score] += 1
        session[:round] += 1

	when (@player_choice == "Rock" && @computer == "Scissors") ||
		(@player_choice == "Paper" && @computer == "Rock") ||
		(@player_choice == "Scissors" && @computer == "Paper")
  		session[:round_winner] = "Player chose #{@player_choice}, computer chose #{@computer}, player wins!"
        session[:player_score] += 1
        session[:round] += 1

	end
  redirect "/"


end

get '/reset' do
  session.clear
  redirect '/'

end
