Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations' },
                     path_names: {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'sign-up'}
  resources :writers, except: [:destroy] do
    resources :stories
    resources :activities, except: [:show]
    resources :goals, only: [:index, :edit, :update]
    get :wall, on: :member
  end
  get '/writers/:id/become', to: 'writers#become', as: 'become'
end
