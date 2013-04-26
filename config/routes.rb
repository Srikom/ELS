ELS::Application.routes.draw do

  resources :staff_panel do
    get :show_application, on: :member
    get :archive, on: :member
    get :profile,on: :member
    get :new_application, on: :member
    post :create_application, on: :member
    get :edit_application, on: :member
    post :update_application, on: :member
    put :edit_profile,on: :member
    get :archive_application, on: :collection
    post :submit_application, on: :member
    post :destroy_application, on: :member
  end
  
  match '/index', :controller => "staff_panel", :action => "index"

  resources :admin_panel do 
    get :showManager, on: :member
    get :showStaff, on: :member
    get :showManagement, on: :member
    delete :destroyStaff, on: :member
    delete :destroyManager, on: :member
    delete :destroyManagement, on: :member
  end
  
  resources :manager_panel do
    get :showApplication, on: :member
    put :updateReview, on: :member
    get :applicationArchive, on: :collection
    get :report, on: :collection
    get :showReport, on: :member
  end
  resources :management_panel do
    get :showApplication, on: :member
    put :updateReview, on: :member
    get :applicationArchive, on: :collection
    get :reportManagement, on: :collection
    get :showReportManagement, on: :member
  end
 
  devise_for :admins

  devise_for :managements do
    get 'managements', :to => 'management_panel#show', :as => :management_root
  end
  devise_for :managers do
    get 'managers', :to => 'manager_panel#show', :as => :manager_root
  end


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
