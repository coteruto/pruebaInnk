Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :users
  resources :movies
  resources :series

  get 'movies/:id/associate_user' => 'movies#associate_user', as: :associate_movie_user
  delete 'movies/:movie_id/user/:id' => 'users#dissociate_movie_user', as: :dissociate_movie_user

  get 'series/:id/associate_user' => 'series#associate_user', as: :associate_serie_user
  delete 'series/:serie_id/user/:id' => 'users#dissociate_serie_user', as: :dissociate_serie_user

  get 'user/:id/add_movies_association' => 'users#add_movies_association', as: :add_movies_association
  patch 'user/:id/associate_movies' =>'users#associate_movies', as: :associate_movies

  get 'user/:id/add_series_association' => 'users#add_series_association', as: :add_series_association
  patch 'user/:id/associate_series' =>'users#associate_series', as: :associate_series

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
