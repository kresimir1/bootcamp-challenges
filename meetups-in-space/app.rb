require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order("lower(name)")
  erb :'meetups/index'
end

get "/meetups/new" do
  @meetups = Meetup.new
  erb :new
end

get "/meetups/:id" do
  @meetups = Meetup.find(params[:id])
  @members = MeetupsUser.where("meetup_id = ?", params[:id])
  @usernames = []
  @avatars = []
  @members.each do |member|
    @usernames << (User.find(member.user_id)).username
    @avatars << (User.find(member.user_id)).avatar_url
  end
  erb :details
end

post "/meetups" do
  @meetups = Meetup.new(params[:meetups])
  if @current_user.nil? && session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
    session[:user_id] = nil unless @current_user
  end
  unless @current_user.nil?
    @meetups.creator = @current_user.username
  end


  if @meetups.save
    flash[:notice] = "You have succesfully created a meetup"
    redirect "/meetups/#{@meetups.id}"
    erb :details
  else
    if @meetups.creator.nil?
      @error_message = "You must be signed in to create a meetup!"
    elsif @meetups.name == ""
      @error_message = "Please enter a name for your meetup!"
    elsif @meetups.location == ""
      @error_message = "Please enter a location for your meetup!"
    elsif @meetups.description == ""
      @error_message = "Please enter a description for you meetup!"

    end
    erb :new

  end
end

post '/meetups/:id' do

  meetup_id = params[:id]
  @members = MeetupsUser.where("meetup_id = ?", params[:id])
  @users = []
  @members.each do |member|
    @users << (User.find(member.user_id)).id
  end


  if current_user.nil?
    flash[:notice] = "You must sign in to join this meetup"
  elsif @users.include?(current_user.id)
   flash[:notice] = "You are already a member of this meetup!"
  elsif current_user
    members =  MeetupsUser.create(user_id: current_user.id, meetup_id: params[:id])
    flash[:notice] = "You have succesfully joined the meetup"
    redirect "/meetups/#{params[:id]}"
  end

end
