Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :merchants,
    path: "api/v1/auth/merchants",
    path_names: {
      sign_in: "sign_in",
      sign_out: "sign_out",
      registration: "sign_up"
    },
    controllers: {
    sessions: "merchants/sessions",
    registrations: "merchants/registrations"
  }
  devise_for :customers,
    path: "api/v1/auth/customers",
    path_names: {
      sign_in: "sign_in",
      sign_out: "sign_out",
      registration: "sign_up"
    },
    controllers: {
      sessions: "customers/sessions",
      registrations: "customers/registrations"
    }

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show, :update] do
        member do
          get :transactions
          get :terminals
          get :dashboard
        end
      end
      resources :customers, only: [:show, :update] do
        member do
          get :transactions
        end
        resources :cards, only: [:index, :create, :destroy]
      end
      
      resources :cards, only: [] do
        collection do
          post :register

        end
      end
      get 'cards/:uid', to: 'cards#show', as: 'card'

      resources :terminals, only: [:create, :show, :update, :destroy]
      resources :payments, only: [:show] do
        collection do
          post :charge
          post :refund
        end
      end

      namespace :admin do
        resources :merchants, only: [] do
          collection do
            get :pending
            
          end
          member do
            post :approve
            post :reject
          end

        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  # Defines the root path route ("/")
  # root "posts#index"
end
