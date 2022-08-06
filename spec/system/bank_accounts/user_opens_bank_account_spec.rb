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

  it 'successfully' do
    visit new_client_registration_path
    fill_in 'CPF', with: '123456789-10'
    fill_in 'Nome', with: 'José'
    fill_in 'Sobrenome', with: 'da Silva'
    fill_in 'Data de nascimento', with: '06/08/1992'
    fill_in 'E-mail', with: 'josesilva@bankatm.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Abrir conta'

    expect(page).not_to have_content 'Sou cliente'
    expect(page).not_to have_content 'Abrir conta'
    expect(page).to have_content 'Bem vindo! Conta aberta com sucesso.'
    expect(page).to have_content 'Olá José'
    expect(page).to have_content 'Agência:'
    expect(page).to have_content 'Conta:'
  end
end

