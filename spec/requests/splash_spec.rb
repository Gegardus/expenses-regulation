require 'rails_helper'

RSpec.describe 'Splashes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      get root_path
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      get root_path
      expect(response.body).to include('KEEP YOUR EXPENSES <br/> IN CHECK')
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
