require 'rails_helper'

describe BankCreditMaker do
  context '.call' do
    it 'Make credit in bank account' do
      bank_account = create(:bank_account, balance: 0)
      amount = 1_000
      
      BankCreditMaker.call(bank_account, amount)

      expect(BankAccount.last.balance).to eq 1_000
    end
  end
end
