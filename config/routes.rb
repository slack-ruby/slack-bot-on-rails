Rails.application.routes.draw do
  root 'home#index'
  resources :messages, only: :index
end
