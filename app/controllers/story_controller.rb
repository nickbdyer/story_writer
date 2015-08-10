class StoryWriter < Sinatra::Base

  post '/stories/new' do
    @@story = Story.new
    @child_lines = []
    erb :story
  end

  post '/lines/new' do
    @current_line, @child_lines = add_new_line(@@story, params)
    erb :story
  end

  get '/lines/:id' do
    @current_line, @child_lines = set_active_line(@@story, params[:id])
    erb :story
  end

end

