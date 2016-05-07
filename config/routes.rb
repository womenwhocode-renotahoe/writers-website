Rails.application.routes.draw do
  devise_for :users
  resources :writers, only: [:index, :new, :create, :show, :edit, :update, :dashboard] do
    resources :stories
    resources :goals
    resources :writer_goals
  end
  get '/writers/:id/dashboard', to: 'writers#dashboard', as: 'dashboard'
end
