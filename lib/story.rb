class Story

  attr_reader :content, :story
  attr_accessor :parent_reference

  def initialize
    @story = Hash.new
    @content = [] 
    @parent_reference = ""
  end

  def add_line(sentence, reference)
    @story[@parent_reference + reference] = sentence
  end

  def list_content
    @content = @story.values
    @content
  end

  def retrieve_line(reference)
    @story[reference]
  end
end
