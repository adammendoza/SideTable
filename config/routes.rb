Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#root'

   resource :session, only: [:new, :create, :destroy]
   resources :users, only: [:new, :create]

   delete 'api/shelving' => "api/shelvings#destroy_by_ids"
   namespace :api, defaults: {format: :json} do
     resources :users, only: [:show]
     resources :ratings, only: [:create, :update, :destroy, :show]
     resources :reviews, only: [:create, :update, :destroy, :show]
     resources :shelvings, only: [:create, :destroy, :show]
     get 'games/explore' => 'games#explore'
     resources :games, only: [:show, :index, :update] do
       get 'page/:page', :action => :index, :on => :collection
     end
     resources :shelves, only: [:show, :index, :update, :create] do
       resources :games, only: [:index]
     end
   end


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
