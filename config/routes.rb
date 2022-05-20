Rails.application.routes.draw do
  resources :factures do
    resources :recipients, only: [ :show ]
  end
end
