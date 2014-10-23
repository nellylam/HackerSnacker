require 'spec_helper'

describe Story do
  let(:story) { Story.new title: "story title" }
  it "creates a new story" do
    story
    expect{ story.save }.to change { Story.count }.by 1
  end
end