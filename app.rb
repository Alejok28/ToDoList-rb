require 'sinatra'
require 'httparty'
require "make_todo"


get '/' do
  @all = Tarea.all
  erb :index
end

get '/add' do
  @all = Tarea.all
  erb :add
end

post '/add' do
  @add = Tarea.create(params[:add])
  redirect '/add'
end

get '/update' do
  @all = Tarea.all
  erb :update
end

post '/update' do
  Tarea.update(params[:update])
  redirect '/update'
end

get '/delete' do
  @all = Tarea.all
  erb :delete
end

post '/delete' do
  Tarea.destroy(params[:delete])
  redirect '/delete'
end

get '/search' do
  if params[:search]==nil
    @all = Tarea.all
  else
  @all = [Tarea.find(params[:search].to_i)]
  end
  erb :search
end
# end
# get '/search' do
#   @all = Tarea.all
#   erb :search
# end
#
# post '/search' do
#   @all = [Tarea.find(params[:search])]
#   redirect '/search'
# end
