FreightExchange::Application.routes.draw do
  # get "orders/purchase_status"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "help_center/our_network"=> 'help_center#our_network', as: :our_network
  get "loads/user_profile"=> 'loads#user_profile', as: :user_profile
  resources :contact
  resources :loads
  resources :trucks
  resources :services
  resources :subscriptions
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations", confirmations: 'confirmations' }
  get "welcome/index"
  get 'payment_data' => 'orders#payment_data'
  get 'send_booked_mail' => 'loads#send_booked_mail'
  get 'send_truck_booked_mail' => 'trucks#send_truck_booked_mail'
  get 'distance_calculation' => 'loads#distance_calculation', as: :distance_calculation
  get 'root_direction' => 'loads#root_direction', as: :root_direction
  get 'warehouse-inquiry' => 'services#warehouse_inquiry', as: :warehouse_inquiry
  get 'franchise-inquiry' => 'services#franchise_inquiry', as: :franchise_inquiry
  get 'vehicle-loan-inquiry' => 'services#vehicle_loan_inquiry', as: :vehicle_loan_inquiry
  post '/purchase' => 'orders#purchase_status'
  post '/subscribe_user' => 'subscriptions#subscribe_user'
  # get '/subscribe_user' => 'subscriptions#subscribe_user', as: :subscribe_user
  get '/truck_user_profile' => 'trucks#truck_user_profile'
  get '/load_user_profile' => 'loads#load_user_profile'
  get '/make_confirmation_load' => 'loads#make_confirmation_load'
  get '/load_status' => 'loads#load_status'
  ## Redirect to root url for unknown path ###
  match '*path' => redirect('/'), via: :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get '/:token/confirm_email/', :to => "registrations#confirm_email", as: 'confirm_email'
  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'welcome/test' => 'welcome#test'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    # resources :products

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
