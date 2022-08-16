Rails.application.routes.draw do
  devise_for :clients

  root 'home#index'
  resources :bank_accounts, only: %i[destroy], as: 'close_bank_account' do
    patch '/reactivate', to: 'bank_accounts#reactivate'
  end
  resources :deposits, only: %i[new create]
end
