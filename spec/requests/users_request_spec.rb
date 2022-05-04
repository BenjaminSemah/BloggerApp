require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#index" do
    before :each do
      get users_path
    end

    it "checks if response status was correct" do
      expect(response).to have_http_status(:ok)
    end

    it "checks if a correct template was rendered" do
      expect(response).to render_template('index')
    end

    it "checks if response body includes placeholder" do
      expect(response.body).to include("This page will display ALL USER")
    end
  end

  describe "GET users#show" do
    before :each do
      get user_path(id: 29)
    end

    it "checks if response status was correct" do
      expect(response).to have_http_status(:ok)
    end

    it "checks if a correct template was rendered" do
      expect(response).to render_template('show')
    end

    it "checks if response body includes placeholder" do
      expect(response.body).to include("This page will display a SINGLE USER")
    end
  end
end
