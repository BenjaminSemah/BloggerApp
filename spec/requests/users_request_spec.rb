require 'rails_helper'

RSpec.describe 'All Users', type: :request do
  describe 'GET users#index' do
    before :each do
      get users_path
    end

    it 'checks if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if a correct template was rendered' do
      expect(response).to render_template('index')
    end
  end
end

# rubocop:disable Lint/EmptyBlock
RSpec.describe 'Single Users', type: :request do
  describe 'GET users#show' do
  end
end
# rubocop:enable Lint/EmptyBlock
