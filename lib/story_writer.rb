require 'sinatra/base'
require_relative 'story'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  STORY = Story.new

  get '/' do
    erb :index
  end

  get '/create_story' do
    @child_lines = []
    erb :story
  end

  post '/first_line' do
    STORY.add_line(params["newline"], params["reference"])
    STORY.parent_reference = "0"
    @current_line = STORY.retrieve_line(params["reference"])
    @child_lines = []
    erb :story
  end

  post '/add_line' do
    STORY.add_line(params["newline"], params["reference"])
    @current_line = STORY.retrieve_line(STORY.parent_reference)
    @child_lines = STORY.collect_child_lines_of(STORY.parent_reference)
    erb :story
  end

  post '/select_line' do
    @current_line = STORY.retrieve_line(params["reference"])
    @child_lines = STORY.collect_child_lines_of(params["reference"])
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
