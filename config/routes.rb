Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :writers, only: [:index, :new, :create, :show, :edit, :update, :wall] do
    resources :stories
    resources :writer_goals
    resources :activities, except: [:show]
  end
  get '/writers/:id/wall', to: 'writers#wall', as: 'wall'
end
