require 'rails_helper'

RSpec.describe 'user_show_path', type: :feature do
  describe 'User show page' do
    before(:each) do
      @first_user = User.create(name: 'Victor', photo: 'link', bio: 'bio', posts_counter: 4,
                                email: 'victor@gmail', password: '123456', password_confirmation: '123456')
      @second_user = User.create(name: 'Bad', photo: 'link', bio: 'bio', posts_counter: 0,
                                 email: 'devi@gmail', password: '123456', password_confirmation: '123456')
      @third_user = User.create(name: 'Bade', photo: 'link', bio: 'bio', posts_counter: 0,
                                email: 'devii@gmail', password: '123456', password_confirmation: '123456')

      visit('users/sign_in')
      fill_in 'Email', with: 'victor@gmail'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @first_post = Post.create(user: @first_user, title: 'Number One', text: 'This is my first post')
      @second_post = Post.create(user: @first_user, title: 'Number Two', text: 'This is my second post')
      @third_post = Post.create(user: @first_user, title: 'Number Three', text: 'This is my third post')
      @fourth_post = Post.create(user: @first_user, title: 'Number Four', text: 'This is my fourth post')

      visit user_path(@first_user.id)
    end

    it 'Check for user profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('link')
      end
    end

    it 'displays username' do
      expect(page).to have_content('Victor')
    end

    it 'displays number of posts by user' do
      expect(page).to have_content(4)
    end

    it 'displays user bio' do
      expect(page).to have_content('bio')
    end

    # it 'displays posts' do
    #   expect(page).to have_content('Number Two')
    # end


    it 'displys profile picture of each user' do
      @first_user.recent_posts.each do |post|
        expect(post).to eq('This is my fourth post')
        expect(post).to eq('This is my third post')
        expect(post).to eq('This is my second post')
      end
    end

    it 'displays button to see all posts by user' do
      expect(page).to have_button('See all posts')
    end

    it 'displays all post by user when all post button is clicked' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end
end
