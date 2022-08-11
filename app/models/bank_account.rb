class BankAccount < ApplicationRecord
  belongs_to :client

  enum status: { active: 5, closed: 10 }

  before_validation :generate_agency_number, :generate_account_number, on: :create

  private

  def generate_agency_number
    self.agency_number = SecureRandom.random_number(9999)
  end

  def generate_account_number
    self.account_number = SecureRandom.random_number(9999999)
  end
end
