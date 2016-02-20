Rails.application.routes.draw do

  get 'new' => 'form#new'                     #new form action form
  post 'new' => 'form#create'         #create new form action
  get 'show/:id' => 'form#show'       #form admin section
  get 'delete/:id' => 'form#delete'   #form admin section
  get 'confirm/:id' => 'form#confirm'
  post 'go/:id' => 'form#submit'      #external form submission

  get 'contact' => 'static_pages#contact'
  get 'guide' => 'static_pages#guide'
  get '.well-known/acme-challenge/:id' => 'static#lets_encrypt'

  root 'static_pages#home'

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
