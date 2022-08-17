require 'rails_helper'

RSpec.describe 'Testing transactions', type: :feature do
  before(:each) do
    @user = User.create(name: 'Name', email: 'name@example.com', password: '123456')
    @category = Category.create(name: 'Category', user: @user)
    @transaction = Transaction.create(user: @user, category: @category, name: 'Fruit', amount: 14)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit category_path(@category.id)
    click_link('New Transaction')
  end

  describe 'transactions#new' do
    it 'adds data to form and sucessufully submits' do
      find('#name').set 'apples'
      find('#amount').set 50
      click_on 'Submit'
      expect(page).to have_content 'apples'
      expect(page).to have_content('50')
    end
  end
end
