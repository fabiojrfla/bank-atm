class Credit < ApplicationRecord
  belongs_to :bank_account

  enum credit_type: { deposit: 5 }

  before_create :integer_to_cents

  private

  def integer_to_cents
    self.amount *= 100
  end
end
