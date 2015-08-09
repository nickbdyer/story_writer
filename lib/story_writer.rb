require 'sinatra/base'
require_relative 'story'
#require_relative 'helpers'

class StoryWriter < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }

  @@story = Story.new

  get '/' do
    erb :index
  end

  get '/stories/1' do
    @@story.parent_reference = "0"
    @current_line = @@story.retrieve_line(@@story.parent_reference)
    @child_lines = @@story.collect_child_lines_of(@@story.parent_reference)
    erb :story
  end

  post '/stories/new' do
    @@story = Story.new
    @child_lines = []
    erb :story
  end


  post '/first_line' do
    @@story.add_line(params["newline"], params["reference"])
    @@story.parent_reference = "0"
    @current_line = @@story.retrieve_line(params["reference"])
    @child_lines = @@story.collect_child_lines_of(@@story.parent_reference)
    erb :story
  end

  post '/lines/new' do
    @@story.add_line(params["newline"], params["reference"])
    @current_line = @@story.retrieve_line(@@story.parent_reference)
    @child_lines = @@story.collect_child_lines_of(@@story.parent_reference)
    erb :story
  end

  get '/lines/:id' do
    @@story.parent_reference = @@story.parent_reference + params[:id]
    @current_line = @@story.retrieve_line(@@story.parent_reference)
    @child_lines = @@story.collect_child_lines_of(@@story.parent_reference)
    erb :story
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
