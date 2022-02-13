Rails.application.routes.draw do

    mount ActionCable.server => '/cable'

    root 'home#index'
    
    namespace :api, defaults: { format: :json }  do
        namespace :v1 do
            resources :customers, only: [:update]
            resources :drivers, only: [:index, :create, :update, :destroy]
            resources :rides, only: [:index, :create, :update, :destroy, :show] do
                put '/started',   to: 'rides#started'
                put '/finished',  to: 'rides#finished'
            end
        end
    end
        
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    devise_scope :user do
        post '/account_validation' => 'users/registrations#account_validation'
    end


end
