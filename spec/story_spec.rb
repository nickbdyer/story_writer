require 'story'

describe Story do

  it "is initialised with no content" do
    story = Story.new()
    expect(story.content).to be_empty
  end

  it "is initialised with no parent line reference" do
    story = Story.new()
    expect(story.parent_reference).to eq ""
  end

  it "can have a line added to it" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    expect(story.content).to include "Once upon a time..."
  end

  it "can retrieve a line" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    expect(story.retrieve_line("A")).to eq "Once upon a time..."
  end

  it "can have a line reference issued to it" do
    story = Story.new()
    story.parent_reference = "B"
    expect(story.parent_reference).to eq "B"
  end

end
