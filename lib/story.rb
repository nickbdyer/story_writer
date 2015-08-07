class Story

  attr_reader :content, :story, :children
  attr_accessor :parent_reference

  def initialize
    @story = Hash.new
    @content = [] 
    @parent_reference = ""
    @children = []
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

  def collect_child_lines_of(parent_reference)
    replace_current_children(parent_reference)
    @children
  end

  private

  def replace_current_children(parent_reference)
    @children = []
    ("A".."D").to_a.each do |child|
      @children << @story[parent_reference + child]
    end
  end

end
