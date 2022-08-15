require 'rails_helper'

describe 'Client closes his bank account' do
  it 'if authenticated' do
    delete(close_bank_account_path(1))

    expect(response).to redirect_to new_client_session_path
  end
end
