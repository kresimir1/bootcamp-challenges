require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces



get '/' do
  @contacts = Contact.all
  @id = params[:id]

  erb :index
end

get '/:id' do
  @id = params[:id]
  @contact = Contact.find(@id)
  erb :show
end
