class StoryWriter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }
  set :views, Proc.new { File.join(root, "..", "views") }

  @@story = Story.new

  run! if app_file == $0
end
