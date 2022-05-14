require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations for Like Model' do
    before(:each) do
      @user = User.new(name: 'Maria', photo: 'photo.png', bio: 'Developer from Ghana')
      @post = Post.new(author: @user, title: 'Post Title' text: 'This is the post text')
      @like = Like.new(author: @user, post_id: @post.id)
    end

    it 'Checks if author_id is present' do
      @like.author_id = false
      expect(@like).to_not be_valid
    end

    it 'Checks if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'Checks if like is present' do
      expect(@post.likes.length).to eq 1
    end
  end
end
