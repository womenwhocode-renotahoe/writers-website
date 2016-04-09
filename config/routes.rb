Rails.application.routes.draw do
  devise_for :users
  resources :writers, only: [:new, :create, :show, :edit, :update]
  root to: 'writers#new'
end
