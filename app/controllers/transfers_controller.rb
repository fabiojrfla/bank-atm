class TransfersController < ApplicationController
  before_action :authenticate_client!
  before_action :check_payee, only: :create

  def new
    @transfer = Debit.new
  end

  def create
    @transfer = Debit.new(debit_type: 'transfer', amount: amount, bank_account: current_client.bank_account)
    if @transfer.save
      Credit.create!(credit_type: 'transfer', amount: @transfer.amount, bank_account: payee.bank_account)
      flash[:success] = 'Transferência realizada com sucesso.'
      redirect_to new_transfer_path
    else
      @transfer.amount = ''
      flash.now[:error] = 'Não foi possível realizar a transferência.'
      render 'new'
    end
  end

  private

  def transfer_params
    params.require(:debit).permit(:payees_registration_number, :amount)
  end

  def payee
    return unless current_client&.registration_number != transfer_params[:payees_registration_number]

    Client.find_by(registration_number: transfer_params[:payees_registration_number])
  end

  def amount
    IntegerToCentsConverter.call(transfer_params[:amount])
  end

  def check_payee
    return if payee&.bank_account&.active?

    @transfer = Debit.new
    @transfer.errors.add(:client, 'não encontrado ou conta bancária encerrada')
    flash.now[:error] = 'Não foi possível realizar a transferência.'
    render 'new'
  end
end
