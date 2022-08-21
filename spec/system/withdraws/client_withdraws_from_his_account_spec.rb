require 'rails_helper'

describe 'Client withdraws from his bank account' do
  it 'successfully' do
    client = create(:client)
    create(:credit, amount: 100_000, bank_account: client.bank_account)

    login_as client
    visit root_path
    click_on 'Sacar'
    fill_in 'Valor R$', with: '1000'
    click_on 'Sacar'

    expect(current_path).to eq new_withdraw_path
    expect(page).to have_content 'Saque realizado com sucesso.'
    expect(page).to have_content 'Seu saldo: R$ 0,00'
  end
end
