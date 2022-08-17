require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:each) do
    @user = User.create(name: 'Vahan', email: 'vah@vah.com', password: 'password')
    @category = Category.create(user: @user, name: 'Fruit')
    @transaction = Transaction.create(user: @user, category: @category, name: 'Fruit', amount: 14)
  end

  it 'checks if transaction attributes are valid' do
    expect(@transaction).to be_valid
  end

  it 'checks if title is not blank' do
    @transaction.name = nil
    expect(@transaction).not_to be_valid
  end

  it 'if payment amount is not blank' do
    @transaction.amount = nil
    expect(@transaction).not_to be_valid
  end

  it 'if payment amount is number' do
    @transaction.amount = 'NAN'
    expect(@transaction).not_to be_valid
  end

  it 'checks if title is not exceeding 150 characters' do
    @transaction.name = 'Hello world Hello world Hello world Hello world Hello
    Hello world Hello world Hello world Hello world Hello world Hello world
    Hello world Hello world Hello world Hello world Hello world Hello world
    Hello world Hello world Hello world Hello world Hello world Hello world
    Hello world Hello world Hello world Hello world Hello world Hello world
    Hello world Hello world Hello world Hello world Hello world Hello world'
    expect(@transaction).not_to be_valid
  end
end
