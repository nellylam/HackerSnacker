require 'spec_helper'

describe User do
  let(:user) { User.new username: "Bob" }
  it "creates a new user" do
    user
    expect{ user.save }.to change { User.count }.by 1
  end
end