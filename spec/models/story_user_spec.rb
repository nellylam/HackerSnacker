require 'spec_helper'

describe StoryUser do
  let(:story_user) { StoryUser.new user_id: 1, story_id: 1 }
  it "creates a new story_user" do
    story_user
    expect{ story_user.save }.to change { StoryUser.count }.by 1
  end
end