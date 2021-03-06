Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :users
  resources :products

  root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
   match '/products/:id/upload_images/' => 'products#upload_images',  via: [:put]
   match '/products/:id/image_show/' => 'products#image_show',  via: [:get]
   match '/products/:id/originalimage_show/' => 'products#originalimage_show',  via: [:get]
   match '/products/:id/getproductimages/' => 'products#getproductimages',  via: [:get]

   match '/getuser_rate' => 'rater#getuser_rate',  via: [:post]
   match '/get_reviews' => 'rater#get_reviews',  via: [:post]
   match '/get_allreviews' => 'rater#get_allreviews',  via: [:post]
   match '/delimage' => 'products#delimage',  via: [:post]
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
