
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(params)
    redirect "/articles/#{Article.last.id}"
    erb :index
  end

  get '/articles' do
    @articles=Article.all
    erb :index
  end

  get '/articles/:id' do
    @article=Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article=Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    puts params
    @article=Article.find(params[:id])
    @article.title=params[:title]
    @article.content=params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    # @article=Article.find(params[:id])
    Article.destroy(params[:id])
  end

end
