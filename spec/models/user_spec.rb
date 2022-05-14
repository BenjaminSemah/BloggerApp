require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for User Model' do
    before(:each) do
      @user = User.new(name: 'Maria', photo: 'photo.png', bio: 'Developer from Ghana')
    end

    before { @user.save }

    it 'Checks if name is present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'Checks if post counter is an integer' do
      @user.posts_counter = 'string'
      expect(@user).to_not be_valid
    end

    it 'should have 0 posts' do
      expect(@user.recent_posts.length).to eq 0
    end
  end
end
