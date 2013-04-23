ELS::Application.routes.draw do

  resources :staff_panel do
  #match 'view_profile', to: 'staff_panel#view_profile'
  get :show_application, on: :member
  get :archive, on: :member
  end
  
  match '/index', :controller => "staff_panel", :action => "index"
 match '/profile', :controller => "staff_panel", :action => "profile"
 match '/_form', :controller => "staff_panel", :action => "_form"
 match '/archive', :controller => "staff_panel", :action => "archive"

  resources :admin_panel do 
    get :showManager, on: :member
    get :showStaff, on: :member
    get :showManagement, on: :member
  end
  
  resources :manager_panel do
    get :showApplication, on: :member
    put :updateReview, on: :member
    get :applicationArchive, on: :collection
    get :report, on: :collection
    get :showReport, on: :member
    get :editPassword, on: :member
    get :updatePassword, on: :member
  end
  resources :management_panel
 
  devise_for :admins

  devise_for :managements
  devise_for :managers


  devise_for :staffs


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  devise_scope :staff do
    root to: "devise/sessions#new"
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
