Rails.application.routes.draw do
  devise_for :clients

  root 'home#index'
  resources :bank_accounts, only: :destroy do
    patch '/reactivate', to: 'bank_accounts#reactivate'
    get '/balance', to: 'bank_accounts#balance', on: :collection
  end
  resources :deposits, only: %i[new create]
  resources :withdraws, only: %i[new create]
end
