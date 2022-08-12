class User < ApplicationRecord
    has_many :categories
    has_many :transactions, through: :categories
  
    validates :name, :email, :password, presence: true
  end
end
