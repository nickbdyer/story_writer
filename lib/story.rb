class Story

  attr_reader :content

  def initialize
    @story = Hash.new
    @content = @story.values
  end

end
