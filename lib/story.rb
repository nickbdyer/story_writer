class Story

  attr_reader :content, :story
  attr_accessor :parent_reference

  def initialize
    @story = Hash.new
    @content = [] 
    @parent_reference = ""
  end

  def add_line(sentence, reference)
    @story[reference] = sentence
    check_content
  end

  def check_content
    @content = @story.values
  end

  def retrieve_line(reference)
    @story[reference]
  end
end
