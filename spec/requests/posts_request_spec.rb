require 'rails_helper'

RSpec.describe 'All Posts', type: :request do
  describe 'GET posts#index' do
    before :each do
      user = User.create(name: 'Maria', bio: 'Developer from Ghana', photo: 'photo.png')
      get user_posts_path(user_id: user.id)
    end

    it 'checks if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if correct template was rendered' do
      expect(response).to render_template('index')
    end

    it 'checks if response includes placeholder' do
      expect(response.body).to include('ALL POSTS for User')
    end
  end
end

RSpec.describe 'Single Post', type: :request do
  describe 'GET posts#show' do
    before :each do
      user = User.create(name: 'Maria', bio: 'Developer from Ghana', photo: 'photo.png')
      get user_posts_path(user_id: user.id)
    end

    it 'checks if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if correct template was rendered' do
      expect(response).to render_template('show')
    end

    it 'checks if response includes placholder' do
      expect(response.body).to include('Display SINGLE POST for a user')
    end
  end
end
