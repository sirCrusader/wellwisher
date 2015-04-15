Rails.application.routes.draw do

  #match '/auth/:provider/callback' :to => 'authentications#create', via: 'get'
  #match '/authentications', :to => 'authentications#create', via: 'get'

  # devise_scope :user do
  #   authenticated :user do
  #     root to: 'persons#profile'
  #   end
  #
  #   unauthenticated do
  #     root to: 'home#index'
  #   end
  # end

  authenticated :user do
    root to: 'persons#profile', as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  resource :home, only: :index
  resources :project
  resources :tasks
  resources :categories
  resources :wishes

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/omniauth/sign_out' => 'users/omniauth_callbacks#signout'
  end

  get 'persons/profile'

  #http://localhost:3000/users/sign_in
  #http://localhost:3000/users/sign_up
  #http://localhost:3000/users/password/new
  #http://localhost:3000/users/confirmation/new
  #http://localhost:3000/users/unlock/new

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #Список роутов можно получить через консоль. Достаточно ввести команду:
  #bundle exec rake routes

  # You can have the root of your site routed with "root"
  #root 'home#index'
  #root 'persons#profile'

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

