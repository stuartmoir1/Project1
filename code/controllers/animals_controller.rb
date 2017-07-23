require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/animal'
require_relative '../models/owner'

get '/animals' do
  @animals = Animal.all
  @heading = 'Animals'
  erb(:"animals/index")
end

get '/animals/new' do
  @owners= Owner.all
  erb(:"animals/new")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners= Owner.all
  erb(:"animals/edit")
end

get '/animals/for_adoption' do
  @animals = Animal.for_adoption
  @heading = 'For Adoption'
  erb(:"animals/index")
end

get '/animals/not_for_adoption' do
  @animals = Animal.not_for_adoption
  @heading = 'Not For Adoption'
  erb(:"animals/index")
end

get '/animals/search_by_type' do
  @types = Animal.types
  erb(:"animals/search_by_type")
end

get '/animals/display_by_type' do
  @animals = Animal.by_type(params[:type])
  @heading = params[:type].capitalize + 's'
  erb(:"animals/index")
end

post '/animals/save' do
  animal = Animal.new(params)
  animal.save
  redirect to('/animals')
end

post '/animals/:id/update' do
  animal = Animal.new(params)
  animal.update
  redirect to('/animals')
end

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to("/animals")
end

post '/animals/delete_all' do
  Animal.delete_all
  redirect to("/animals")
end