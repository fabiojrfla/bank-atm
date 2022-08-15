class DepositsController < ApplicationController
  before_action :bank_account, :amount, only: %i[create]

  def new
    @deposit = Credit.new()
  end

  def create
    @deposit = Credit.new(credit_type: 'deposit', amount: amount, bank_account: bank_account)
    if @deposit.save
      BankCreditMaker.call(bank_account, @deposit.amount)
      flash[:success] = 'Depósito realizado com sucesso.'
      redirect_to new_deposit_path
    else
      flash[:error] = 'Não foi possível realizar o depósito.'
      render 'new'
    end
  end

  private

  def amount
    credit_params = params.require(:credit).permit(:amount)
    credit_params[:amount].to_d * 100
  end

  def bank_account
    current_client.bank_account
  end
end
