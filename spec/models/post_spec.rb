require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations for Post Model' do
    before(:each) do
      @user = User.new(name: 'Maria', photo: 'photo.png', bio: 'Developer from Ghana')
      @post = Post.new(author: @user, title: 'Post Title' text: 'This is the post text')
    end

    it 'Checks if attributes pass validations' do
      expect(@post).to be_valid
    end

    it 'Checks if title is present' do
      @post.title = nil
      expect(@post).not_to be_valid
    end

    it 'Checks if title length is 250 characters or less' do
      @post.title = 'This Is My Title'
      expect(@post).to be_valid
    end

    it 'Checks if likes counter is an integer' do
      @post.likes_counter = 'string'
      expect(@post).not_to be_valid
    end

    it 'Checks if likes counter is greater than or equal to zero' do
      @post.likes_counter = -9
      expect(@post).not_to be_valid
    end

    it 'Checks if comments counter is greater than or equal to zero' do
      @post.comments_counter = -9
      expect(@post).not_to be_valid
    end

    it 'Checks comments counter is an integer' do
      @post.comments_counter = 0.99
      expect(@post).not_to be_valid
    end

    if 'if comments counter is integer' do
      @post.comments_counter = 15
      expect(@post).to be_valid
    end
  end
end
