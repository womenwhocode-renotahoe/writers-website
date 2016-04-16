Rails.application.routes.draw do
  devise_for :users
  resources :writers, only: [:new, :create, :show, :edit, :update] do
    resources :stories
  end
  root to: 'writers#new'
end
