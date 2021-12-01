Rails.application.routes.draw do

    root 'home#index'
    
    namespace :api, defaults: { format: :json }  do
        namespace :v1 do
            resources :customers, only: [:update]
            resources :drivers, only: [:index, :create, :update, :destroy]
        end
    end
        
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }



end
