Copter2::Application.routes.draw do
  devise_for :users

  resources :soldiers, :only => [:index, :show]
  resources :weapons, :only => [:index, :show]
  resources :powers, :only => [:index, :show]
  resources :lands, :only => [:index, :show]
  resources :others, :only => [:index, :show]
  resources :monsters, :only => [:index, :show]
  resources :generals, :only => [:index, :show]
  resources :profiles do
    resources :properties, :only => [:index, :update] do
      post 'update_all', :on => :collection
    end
    resources :fighters, :except => [:edit] do
      post 'update_all', :on => :collection
    end
    resources :spells, :except => [:edit] do
      get 'get_info', :on => :collection
      post 'update_all', :on => :collection
    end
    resources :arms, :except => [:edit] do
      get 'get_info', :on => :collection
    end
    resources :accessories, :except => [:edit] do
      get 'get_info', :on => :collection
      post 'update_all', :on => :collection
    end
    resources :recruits, :except => [:edit] do
      get 'get_info', :on => :collection
      post 'update_all', :on => :collection
    end
    resources :loadouts
    resources :alliances
    member do
      get 'updater'
      get 'army_stats'
      get 'div_stats'
      get 'duel_stats'
      get 'war_stats'
      post 'process_data'
      post 'upload_files'
      post 'upload_file'
      post 'income_bonus'
      post 'army_bonus'
      post 'level'
      post 'army_size'
      post 'energy'
      post 'stamina'
      post 'health'
      post 'health_rune'
      post 'damage_rune'
      post 'attack'
      post 'attack_rune'
      post 'attack_ia'
      post 'defense'
      post 'defense_rune'
      post 'defense_ia'
      post 'update_all'
    end
  end
  scope "/items" do
    resources :boots, :only => [:index, :show]
    resources :amulets, :only => [:index, :show]
    resources :armors, :only => [:index, :show]
    resources :helmets, :only => [:index, :show]
    resources :gloves, :only => [:index, :show]
    resources :shields, :only => [:index, :show]
    resources :banners, :only => [:index, :show]
  end
  
  namespace :admin do
    root :controller => "base", :action => "index"
    
    resources :users, :except => [:show, :new] do
      get 'become', :on => :member
    end
    resources :messages
    resources :soldiers, :except => [:show]
    resources :weapons, :except => [:show]
    resources :powers, :except => [:show]
    resources :lands, :except => [:show]
    resources :others, :except => [:show]
    resources :monsters, :except => [:show]
    resources :generals, :except => [:show]
    scope "/items" do
      resources :boots, :except => [:show]
      resources :amulets, :except => [:show]
      resources :armors, :except => [:show]
      resources :helmets, :except => [:show]
      resources :gloves, :except => [:show]
      resources :shields, :except => [:show]
      resources :banners, :except => [:show]
    end
  end
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

  match "*gibberish(.:format)", :to => 'intros#index'

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'intros#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
