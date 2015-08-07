require 'story'

describe Story do

  it "can be initialised with no content" do
    story = Story.new()
    expect(story.content).to be_empty
  end

  it "can have a line added to it" do
    story = Story.new()
    story.add_line "Once upon a time..."
    expect(story.content).to include "Once upon a time..."
  end

end
