require 'sinatra/base'
require_relative 'story'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  STORY = Story.new

  get '/' do
    erb :index
  end

  get '/stories/1' do
    STORY.parent_reference = "0"
    @current_line = STORY.retrieve_line(STORY.parent_reference)
    @child_lines = STORY.collect_child_lines_of(STORY.parent_reference)
    erb :story
  end

  post '/stories/new' do
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

  post '/lines/new' do
    STORY.add_line(params["newline"], params["reference"])
    @current_line = STORY.retrieve_line(STORY.parent_reference)
    @child_lines = STORY.collect_child_lines_of(STORY.parent_reference)
    erb :story
  end

  get '/lines/:id' do
    STORY.parent_reference = STORY.parent_reference + params[:id]
    @current_line = STORY.retrieve_line(STORY.parent_reference)
    @child_lines = STORY.collect_child_lines_of(STORY.parent_reference)
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
