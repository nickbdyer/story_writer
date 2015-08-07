require 'story'

describe Story do

  it "should be initialised with no content" do
    story = Story.new
    expect(story.content).to be_empty
  end

end
