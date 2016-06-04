Rails.application.routes.draw do

  root "pages#home"
  get 'sign_up', to: 'users#new', as: :sign_up
  get 'log_in', to: 'sessions#new', as: :log_in
  post 'sessions', to: 'sessions#create'
  delete 'log_out', to: 'sessions#destroy', as: :log_out


  resources :users, except: [:index]
  resources :profiles do
    resources :bookings
    resources :reviews, only: [:show, :create, :destroy]
  end


  get '/reviews/new/:profile_id' => 'reviews#new'
  get '/reviews/showform/:profile_id' => 'reviews#index'



  # resources :services

  # resources :bookings, only: [:new, :create, :destroy]




  # get '/secret', to: 'pages#index', as: :secret
  # root to: 'pages#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
