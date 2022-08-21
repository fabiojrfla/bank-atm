class BankAccountsController < ApplicationController
  before_action :authenticate_client!
  before_action :set_bank_account, only: %i[destroy reactivate]

  def destroy
    if @bank_account.closed!
      flash[:success] = 'Conta bancária encerrada com sucesso.'
    else
      flash[:error] = 'Algo deu errado.'
    end
    redirect_to root_path
  end

  def reactivate
    if @bank_account.active!
      flash[:success] = 'Conta bancária reativada com sucesso.'
    else
      flash[:error] = 'Algo deu errado.'
    end
    redirect_to root_path
  end

  def balance; end

  private

  def bank_account_id
    params[:id] || params[:bank_account_id]
  end

  def set_bank_account
    @bank_account = BankAccount.find(bank_account_id)
  end
end
