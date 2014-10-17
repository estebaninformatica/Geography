Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # get 'regions/countries/areas/destinations' => 'operators#index_with_providers'
      # get 'regions/countries/areas' => 'operators#index_with_providers'
      # get 'regions/countries' => 'regions#?with=countries'

      # get 'countries/areas/destinations' => 'operators#index_with_providers'
      # get 'countries/areas' => 'operators#index_with_providers'

      # get 'areas/destinations' => 'operators#index_with_providers'
      get 'destinations/criteria/:criteria' => 'destinations#index'
      get 'areas/criteria/:criteria' => 'areas#index'
      resources :regions,      only: [:index, :show] do
        resources :countries,    only: [:index, :show]  do 
          resources :areas,        only: [:index, :show] do
            resources :destinations, only: [:index, :show] 
          end
        end
      end
      
      resources :regions,      only: [:index, :show]
      resources :countries,    only: [:index, :show]
      resources :areas,        only: [:index, :show] 
      resources :destinations, only: [:index, :show]

    end
  end
end
