require 'sinatra/base'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/create_story' do
    erb :story
  end

  post '/create_story' do
    @newline = params["input-box-0"]
    @phrase1 = params["input-box-1"]
    @phrase2 = params["input-box-2"]
    @phrase3 = params["input-box-3"]
    @phrase4 = params["input-box-4"]
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
