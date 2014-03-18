Media::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :verifications

  resources :withdrawal_requests do
    member do
      get 'withdraw'
    end
  end

  resources :payment_addresses

  resources :plans

  get "flags/new"

  get "flags/create"

  resources :albums  do
    resources :comments
    member do
      get 'download'
    end
  end

  resources :activities
  resources :artists do
   member do
    get "up_vote"
   end
  end

  resources :categories

  resources :stories do
    resources :comments
    get 'trending', :on => :collection
  end

  resources :notes do
    resources :comments
  end

  resources :genres

  resources :messages

  match "/about_us" => "info#about_us", as: :about_us
  match "/bug" => "info#about_us", as: :bug
  match "/privacy_policy" => "info#privacy_policy", :as => :privacy_policy
  match "/feedback" => "info#feedback", as: :feedback
  match "/artistes" => "users#artistes", :as => :artistes
  match "report_bug" => "info#bug", :as => :bug_report
  match "verification/:address_id" => "payment_addresses#verify", as: :verification_box

  match "/terms_of_use" => "info#terms_of_use", :as => :terms_of_use
  match "/hypejamz_credit" => "info#hypejamz_credit", :as => :hypejamz_credit
  match "/about_hypejamz_credit" => "info#about_credit", :as => :about_credit
  match "/upgrade_account" => "info#account_upgrade", :as => :account_upgrade

  match "/contact_us" => "info#contact_us", :as => :contact_us
  match "/developers" => "info#developers", :as => :developers
  match "/mobile_featured" => "featured_users#mobile_featured", :as => :mobile_featured
  match "/mobile_featured_song" => "featured_songs#mobile_featured", :as => :mobile_featured_songs
  match "/download_mobile_app" => "info#download_mobile_app", :as => :download_mobile_app
  match "/top_downloads" => "songs#downloads", :as => :top_downloads
  match "/subscribe/:id" => "users#toggle_subscription", :as => :toggle_subscription
  match "/mobile_subscribe/:id" => "users#mobile_subscription", :as => :mobile_subscription
  match '/remove_yarn/:id' => "notes#destroy", :as => :remove_yarn
  match '/back2back' => "artists#index", as: :back_to_back
  match '/join_now' => "info#join_now", as: :join_now
  match '/un_approved' => "songs#not_verified", as: :un_approved
  match "/song_search" => "songs#search", as: :search_box
  match "/users_search" => "users#search", as: :users_search_box
  match "/videos_search" => "videos#search", as: :videos_search_box



  resources :featured_users do
    collection do
      get 'featured'
    end
  end

  resources :featured_songs

  resources :videos do
    member do
      post :add_comment
      post :rate
    end
    new do
       post :upload
       get  :save_video
    end
    resources :comments
  end


  resources :songs do
    member do
      get 'download'
      get 'countdown'
      get 'favourite'
      get 'approve'
      post 'rate'
      get 'report'
    end
    resources :pictures
    resources :comments
    resources :replies
    resources :flags
  end



  match '/admin' => "admins#index", :as => :admin
  resources :authentications


 match '/search' => "users#search", :as => :search
 match '/song_search' => "songs#search", :as => :song_search
 match '/album_search' => "albums#search", :as => :album_search
 match '/latest_songs' => "songs#latest_songs", :as => :latest_songs
 match '/most_popular' => "songs#most_popular", :as => :most_popular
 match '/downloads' => "songs#downloads", :as => :downloads
 match '/json_songs' => "songs#json_songs", :as => :json_songs
 match '/json_users' => "users#json_users", :as => :json_users
 match '/songs_featured' => "songs#featured", :as => :songs_featured
 match '/trending_songs' => "songs#trending", :as => :trending_songs
 match '/updates/:id' => "activities#index", :as => :updates
 match '/fans' => "users#fans", as: :fans
 match 'songs/:id/favorite' => 'songs#favorite', :as => :favorite_songs
  match '/notify', :to => 'notifications#notify', :as => :notification
  match '/success/thank_you', :to => 'users#thank_you', :as => :thank_you
  match '/failed_transaction', :to => 'users#failed_payment', :as => :failed_payment


  devise_for :users, :path_prefix => 'account', path_names: {sign_in: "login", sign_out: "logout" }, controllers: {omniauth_callbacks: "omniauth_callbacks"}

 resources :users do
  resources :songs
  resources :events
   resources :pictures
   resources :videos
   resources :messages
   resources :notes
   resources :comments
   resources :activities
   resources :albums
   resources :withdrawal_requests
   member do
     get 'fans'
   end
 end


  resources :pictures

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}



  resources :comments  do
    member do
      get "remove"
    end
  end



  resources :events do
    resources :pictures
    resources :comments
  end

  resources :sponsors

  match "/:id" => "users#show", :as => :user_profile



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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
