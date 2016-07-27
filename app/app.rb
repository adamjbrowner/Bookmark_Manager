ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/data_mapper_setup'

class Bookmark_manager < Sinatra::Base
  get '/' do
    'Hello Bookmark_manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new_link' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
