require 'rails_helper'

RSpec.describe 'Testing categories views', type: :feature do
  before(:each) do
    @user = User.create(name: 'Name', email: 'name@example.com', password: '123456')
    @category = Category.create(name: 'Test category', user: @user)
    @transaction = Transaction.create(user: @user, category: @category, name: 'Fruit', amount: 14)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'categories#index' do
    it 'for each category, shows the name,
    and the total amount of all the transactions that belongs to that category' do    
      expect(page).to have_content 'Category'
      expect(page).to have_content('$14')
    end

    it '\'s category link brings to show page for that category.' do
      click_on 'Test category'
      expect(current_path).to eq category_path(@category)
    end

    it '\'s "add a new category" button that brings the user to the page to create a new category' do
      click_on 'New Category'
      expect(current_path).to eq new_category_path
    end
  end

  describe 'categories#show' do
    it 'for each payment shows the user name and the amount' do
      visit category_path(@category.id)
      expect(page).to have_content 'Fruit'
      expect(page).to have_content('$14')
    end

    it '\'s "add a new payment" button brings the user to the page to create a new payment' do
      visit category_path(@category.id)
      click_link('New Transaction')
      expect(current_path).to eq new_transaction_path
    end
  end
end
