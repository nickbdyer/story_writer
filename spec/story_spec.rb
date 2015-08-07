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
    expect(story.list_content).to include "Once upon a time..."
  end

  it "can retrieve a line" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    expect(story.retrieve_line("A")).to eq "Once upon a time..."
  end

  it "can have a parent line reference issued to it" do
    story = Story.new()
    story.parent_reference = "B"
    expect(story.parent_reference).to eq "B"
  end

  it "can retrieve a 2nd child line" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    story.parent_reference = "0"
    story.add_line("There was a tiger", "A")
    story.add_line("There was a bear", "B")
    expect(story.retrieve_line("0A")).to eq "There was a tiger"
    expect(story.retrieve_line("0B")).to eq "There was a bear"
  end

  it "can retrieve a 3rd child line" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    story.parent_reference = "0"
    story.add_line("There was a tiger", "A")
    story.add_line("There was a bear", "B")
    story.parent_reference = "0B"
    story.add_line("The bear was hungry", "A")
    story.add_line("The bear was thirsty", "C")
    expect(story.retrieve_line("0BA")).to eq "The bear was hungry"
    expect(story.retrieve_line("0BC")).to eq "The bear was thirsty"
  end

  it "can collect child lines of a given parent line" do
    story = Story.new()
    story.add_line("Once upon a time...", "A")
    story.parent_reference = "0"
    story.add_line("There was a tiger", "A")
    story.add_line("There was a bear", "B")
    story.parent_reference = "0B"
    story.add_line("The bear was hungry", "A")
    story.add_line("The bear was thirsty", "C")
    expect(story.collect_child_lines_of("0B")).to eq ["The bear was hungry", nil, "The bear was thirsty", nil]
  end

end
