class BankAccount < ApplicationRecord
  belongs_to :client

  enum status: { active: 5, closed: 10 }

  validates :account_number, uniqueness: { case_sensitive: false }
  validates :agency_number, :account_number, :balance, presence: true
  validates :agency_number, :account_number, numericality: { only_integer: true, greater_than: 0 }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  before_validation :generate_agency_and_account_numbers, on: :create

  def real_balance
    self.balance.to_d / 100
  end

  private

  def generate_agency_and_account_numbers
    self.agency_number ||= SecureRandom.random_number(9999)
    self.account_number ||= SecureRandom.random_number(9999999)
  end
end
