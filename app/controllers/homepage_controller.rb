class StoryWriter < Sinatra::Base

  get '/' do
    erb :index
  end

end

