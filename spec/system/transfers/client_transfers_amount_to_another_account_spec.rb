require 'rails_helper'

describe 'Client transfers amount to another bank account' do
  it 'successfully' do
    first_client = create(:client)
    create(:credit, amount: 100_000, bank_account: first_client.bank_account)
    second_client = create(:client, registration_number: '10987654321', name: 'Maria', email: 'mariasilva@bankatm.com')

    login_as first_client
    visit root_path
    click_on 'Transferir'
    fill_in 'CPF do favorecido', with: '10987654321'
    fill_in 'Valor R$', with: '500'
    click_on 'Transferir'

    expect(current_path).to eq new_transfer_path
    expect(page).to have_content 'Transferência realizada com sucesso.'
    expect(page).to have_content 'Seu saldo: R$ 500,00'
    expect(second_client.bank_account.real_balance).to eq 500
  end
end
