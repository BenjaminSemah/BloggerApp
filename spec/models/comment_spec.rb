require 'rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.new(user_id: 9, title: 'rspec test', text: 'Create test and let them fail', comments_counter: 0,
                  likes_counter: 0)
  subject do
    Comment.new(user_id: post.user_id, post_id: post.id, text: 'Test Comment')
  end
  before { subject.save }

  it "text shouldn't be empty" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "user_id shouldn't be a string" do
    subject.user_id = 'string'
    expect(subject).to_not be_valid
  end

  it "post_id shouldn't be a string" do
    subject.post_id = 'string'
    expect(subject).to_not be_valid
  end
end
