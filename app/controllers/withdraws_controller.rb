class WithdrawsController < ApplicationController
  def new
    @withdraw = Debit.new
  end

  def create
    @withdraw = Debit.new(debit_type: 'withdraw', amount: integer_amount_to_cents,
                          bank_account: current_client.bank_account)
    if @withdraw.save
      flash[:success] = 'Saque realizado com sucesso.'
      redirect_to new_withdraw_path
    else
      @withdraw.amount = 0
      flash[:error] = 'Não foi possível realizar o saque.'
      render 'new'
    end
  end

  private

  def debit_params
    params.require(:debit).permit(:amount)
  end

  def integer_amount_to_cents
    debit_params[:amount].to_d * 100
  end
end
