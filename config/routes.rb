Rails.application.routes.draw do
  #match '/auth/:provider/callback' :to => 'authentications#create', via: 'get'
  #match '/authentications', :to => 'authentications#create', via: 'get'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resource :home, only: :index
  resource :project
  resource :tasks
  resource :authentications
  resource :categories
  root 'home#index'

  get 'authentications/controller'
  get 'session/controller'
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

