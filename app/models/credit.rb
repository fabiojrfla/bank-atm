class Credit < ApplicationRecord
  belongs_to :bank_account

  enum credit_type: { deposit: 5 }

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 200, message: :greater_than_or_equal_to_integer_number }

end
