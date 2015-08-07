require 'sinatra/base'
require_relative 'story'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  enable :sessions
  STORY = Story.new

  get '/' do
    STORY = Story.new
    erb :index
  end

  post '/create_story' do
    session[:story_id] = STORY.object_id
    @child_lines = []
    erb :story
  end

  post '/first_line' do
    p session
    STORY.add_line(params["newline"], params["reference"])
    STORY.parent_reference = "0"
    p STORY.story
    @current_line = STORY.retrieve_line(params["reference"])
    @child_lines = []
    erb :story
  end

  post '/add_line' do
    p session
    STORY.add_line(params["newline"], params["reference"])
    p STORY.story
    @current_line = STORY.retrieve_line(STORY.parent_reference)
    @child_lines = STORY.collect_child_lines_of(STORY.parent_reference)
    erb :story
  end

  post '/select_line' do
    p session
    @current_line = STORY.retrieve_line(params["reference"])
    @child_lines = STORY.collect_child_lines_of(params["reference"])
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
