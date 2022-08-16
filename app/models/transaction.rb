class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: { maximum: 150 }
  validates :amount, presence: true, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
end
