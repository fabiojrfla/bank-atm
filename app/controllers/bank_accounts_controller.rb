class BankAccountsController < ApplicationController
  before_action :authenticate_client!

  def destroy
    @bank_account = BankAccount.find(params[:id])
    if @bank_account.closed!
      flash[:success] = 'Conta bancária encerrada com sucesso.'
      redirect_to root_path
    else
      flash[:error] = 'Algo deu errado.'
      redirect_to root_path
    end
  end

  def reactivate
    @bank_account = BankAccount.find(params[:close_bank_account_id])
    if @bank_account.active!
      flash[:success] = 'Conta bancária reativada com sucesso.'
      redirect_to root_path
    else
      flash[:error] = 'Algo deu errado.'
      redirect_to root_path
    end
  end
end
