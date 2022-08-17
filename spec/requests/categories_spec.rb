require 'rails_helper'

RSpec.describe '/categories', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Vahan', email: 'test@example.com', password: 'password')
      @category = Category.create(name: 'Category', user: @user)
      @transaction = Transaction.create(user: @user, category: @category, name: 'Payment', amount: 200, category: @category)

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get root_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('categories')
      expect(response.body).to include('Category')
      expect(response.body).to include('$200')
    end
  end

  describe 'GET /new' do
    before(:each) do
      @user = User.create(name: 'Ani', email: 'test@example.com', password: '123456')
      @category = Category.create(name: 'Test category', user: @user)
      @transaction = Transaction.create(user: @user, category: @category, name: 'Payment', amount: 200, category: @category)

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_category_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:new)
    end

    it 'renders correct content' do
      expect(response.body).to include('NEW CATEGORY')      
      expect(response.body).to include('Name')
      expect(response.body).to include('Submit')
    end
  end
end
