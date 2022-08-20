class BankCreditMaker < ApplicationService
  attr_reader :destination_bank_account, :credit_amount

  def initialize(destination_bank_account, credit_amount)
    @destination_bank_account = destination_bank_account
    @credit_amount = credit_amount
  end

  def call
    return unless @credit_amount

    @destination_bank_account.balance += @credit_amount
    @destination_bank_account.save!
  end
end
