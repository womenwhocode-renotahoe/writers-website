Rails.application.routes.draw do
  devise_for :users
  resources :writers, only: [:index, :new, :create, :show, :edit, :update] do
    resources :stories
    resources :goals
    resources :writer_goals
  end
  root to: 'writers#new'
end
