Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :writers, only: [:index, :new, :create, :show, :edit, :update] do
    resources :stories
    resources :activities, except: [:show]
    resources :goals, only: [:edit, :update]
  end
  get '/writers/:id/wall', to: 'writers#wall', as: 'wall'
  get '/writers/:id/goals', to: 'goals#index', as: 'goals'
end
