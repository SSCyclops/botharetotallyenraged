BothAreTotallyEnraged::Application.routes.draw do

  devise_for :admins

  devise_for :users
  #custom signup_signin route
  match "/users/signup_or_signin" => "signup_signin#signup_or_signin"

  resources :matches do
    member do
      get 'show_comments' #TODO: will want to implement this for real eventually. Currently old.
      post 'add_comment'
    end
  end

  resources :comments do
    member do
      post 'vote_for' #TODO: consider making the comment id part of GET variables?
      post 'vote_against'
      post 'undo_vote'
    end
  end

  resources :animals

  resources :ballots do
    member do
      get 'show_my_comments'
    end
    collection do
      get 'show_current'
      get 'show_current_comments'
    end
  end
  
  root :to => "ballots#show_current"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
