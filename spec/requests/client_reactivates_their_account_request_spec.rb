require 'rails_helper'

describe 'Client Reactivates their bank account' do
  it 'if authenticated' do
    patch(close_bank_account_reactivate_path(1))

    expect(response).to redirect_to new_client_session_path
  end
end
