Rails.application.routes.draw do

  resources :corporations, controller: 'publics'

 
  namespace :api do
    get 'yellow/get_business_detail'
    get 'yellow/find_business'
  end

  get 'search/:id' => 'search#show'
  get 'searchs' => 'search#index'
  get 'search/find_business'
  
  
  match 'listing/update_all_ecp' => 'listing#update_all_ecp', :via => :get
  get 'listing/:id/update_ecp_detail' => 'listing#update_ecp_detail'
  get 'listing/:id/update_ecp' => 'listing#update_ecp'
  get 'listing/:id' => 'listing#show'
  get 'listings' => 'listing#index'
  get 'listing/get_business_detail'


  #put 'listing/:id' => 'listing#update_ecp'


  get 'publics/get_individuals'
  get 'publics/get_individual_details'
  get 'publics/get_corporations'
  get 'publics/get_corporation_details'


  resources :search_requests, controller: 'search', action: 'find_business' 
  resources :details, :listings ,controller: 'listing', action: 'get_business_detail' 

  root 'search#show'

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
