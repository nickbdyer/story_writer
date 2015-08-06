require 'sinatra/base'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/create_story' do
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
