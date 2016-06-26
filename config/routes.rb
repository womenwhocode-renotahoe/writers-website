Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :writers, only: [:index, :new, :create, :show, :edit, :update] do
    resources :stories
    resources :goals
    resources :activities, except: [:show]
  end
  get '/writers/:id/wall', to: 'writers#wall', as: 'wall'
end
