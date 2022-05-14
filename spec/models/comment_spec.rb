require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations for Comment model' do
    before(:each) do
      @user = User.new(name: 'Maria', photo: 'photo.png', bio: 'Developer from Ghana')
      @post = Post.new(author: @user, title: 'Post Title' text: 'This is the post text')
      @comment = Comment.new(author_id: @user.id, post_id: @post.id, text: 'My Comment')
    end

    it 'Checks if title is present' do
      @comment.text = nil
      expec(@comment).to_not be_valid
    end

    it 'Checks if author_id is an integer' do
      @comment.author_id = 'string'
      expect(@comment).to_not be_valid
    end

    it 'Checks if post_id is an integer' do
      @comment.post_id = 'string'
      expect(@comment).to_not be_valid
    end
  end
end
