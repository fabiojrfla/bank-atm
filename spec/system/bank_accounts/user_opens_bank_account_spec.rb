require 'rails_helper'

describe 'User opens bank account' do
  it 'from the homepage' do
    visit root_path
    click_on 'Abrir conta'

    expect(current_path).to eq new_client_registration_path
    within 'h2' do
      expect(page).to have_content 'Abra sua conta'
    end
    within 'form' do
      expect(page).to have_field 'CPF'
      expect(page).to have_field 'Nome'
      expect(page).to have_field 'Sobrenome'
      expect(page).to have_field 'Data de nascimento'
      expect(page).to have_field 'E-mail'
      expect(page).to have_field 'Senha'
      expect(page).to have_field 'Confirme sua senha'
      expect(page).to have_button 'Abrir conta'
    end
  end
end

