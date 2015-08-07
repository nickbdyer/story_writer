class Story

  attr_reader :content, :story

  def initialize
    @story = Hash.new
    @content = [] 
  end

  def add_line(sentence)
    @story["line1"] = sentence
    check_content
  end

  def check_content
    @content = @story.values
  end
end
