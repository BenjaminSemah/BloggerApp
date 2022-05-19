require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations for Like Model' do
    before(:each) do
      @user = User.new(name: 'Maria', photo: 'photo.png', bio: 'Developer from Ghana')
      @post = Post.new(user_id: 1, title: 'Post Title', text: 'This is the post text')
      @like = Like.new(user_id: @user.id, post_id: @post.id)
    end

    it 'Checks if user_id is present' do
      @like.user_id = false
      expect(@like).to_not be_valid
    end

    it 'Checks if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'Checks if like is present' do
      expect(@post.likes.length).to eq 0
    end
  end
end
