class DepositsController < ApplicationController
  before_action :authenticate_client!

  def new
    @deposit = Credit.new
  end

  def create
    @deposit = Credit.new(credit_type: 'deposit', amount: integer_amount_to_cents,
                          bank_account: current_client.bank_account)
    if @deposit.save
      flash[:success] = 'Depósito realizado com sucesso.'
      redirect_to new_deposit_path
    else
      @deposit.amount = ''
      flash.now[:error] = 'Não foi possível realizar o depósito.'
      render 'new'
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:amount)
  end

  def integer_amount_to_cents
    credit_params[:amount].to_d * 100
  end
end
