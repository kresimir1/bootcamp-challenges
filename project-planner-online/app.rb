require "sinatra"
require_relative "config/application"

set :bind, '0.0.0.0'  # bind to all interfaces



get "/" do
  redirect "/projects"
end

get "/projects" do
  @projects = Project.all

  erb :index
end

get "/projects/:id" do
  @project = Project.find(params[:id])
  @members = @project.users
  @tasks = @project.tasks
  @tasks_users = []
  @tasks.each do |task|
    @tasks_users << "#{task.name}" + " (assigned to: #{User.find(task.user_id).first_name}
     #{User.find(task.user_id).last_name})"
  end

  erb :show
end
