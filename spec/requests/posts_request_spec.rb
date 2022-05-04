require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET posts#index' do
    before :each do
      get '/users/29/posts'
    end

    it "checks if response status was correct" do
      expect(response).to have_http_status(:ok)
    end

    it "checks if correct template was rendered" do
      expect(response).to render_template('index')
    end

    it "checks if response includes placeholder" do
      expect(response.body).to include("Display ALL POSTS for a user")
    end
  end

  describe 'GET posts#show' do
    before :each do
      get '/users/29/posts/29'
    end

    it "checks if response status was correct" do
      expect(response).to have_http_status(:ok)
    end

    it "checks if correct template was rendered" do
      expect(response).to render_template('show')
    end

    it "checks if response includes placholder" do
      expect(response.body).to include("Display SINGLE POST for a user")
    end
  end
end
