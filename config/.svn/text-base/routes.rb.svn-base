Sociobook::Application.routes.draw do
  
  resources :cadds

  resources :cevents

  resources :pcomments

  resources :members
 
 
  resources :groups do 
    collection do 
      get "egroup"
      get "vgroup"
      get "listgroup"
    end 
  end
  
  resources :cpshares

  resources :cpoptions

  resources :cpolls

  resources :clinks

  resources :cvideos

  resources :cphotos

  resources :cstatuses

  resources :ccomments
  resources :ctags
  resources :csharedwiths
  resources :albums
  resources :pwebsites
  resources :pneighbours
  resources :pemails
  resources :pphones
  resources :pscreens
  resources :friend_profile_groups    
  resources :profile_relations

  resources :profile_employer_projects

  resources :profile_university_classes
  resources :profile_ppl_inspirations
  resources :profile_interests
  resources :profile_activities
  resources :profile_player_sports
  resources :profile_team_sports
  resources :profile_play_sports
  resources :profile_games
  resources :profile_movies
  resources :profile_books
  resources :profile_musics
  resources :profile_universities
  resources :profile_employers
  resources :contacts

  
    resources :contents do 
    member do 
      get "ewall"
      post "create_poll"
      get "vvideo"
      get "valbum"
    end
    collection do 
      post "create_poll"
      get "listalbum"
      get "valbum"
      get "valbum_removephoto"
      get "valbum_makeprofile"
      get "tag_photo"
      post "add_tag"
      post "remove_tag"
      post "shared_with"
      get "ewall"
      get "vvideo"
      get "ccdoc"
      get "cevent"
      get "cadd"
  
    end
  end

  
  
  match 'login' => "user_sessions#new",       :as => :login
  match 'sign_in' => "user_sessions#new",      :as => :sign_in
  match 'sign_up' => "users#new",      :as => :sign_up
  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'signout' => "user_sessions#destroy", :as => :signout
  match 'contact_importer' => "friends#new", :as => :contact_importer

  resources :user_sessions
  resources :users do
    collection do
      get "remove_picture"
    end
  end
  
  resources :profile_groups do
    member do 
      get "add_group"
    end
    collection do 
      get "add_group"
      post "add_friend_to_group"
      post "remove_friend"
    end
  end
  
  resources :profiles do
    member do 
      get "add_punv"
    end
    collection do 
      get "new_view"
    end
   
  end
  
  resources :profile_universities do
    member do
      get "profile_universities"
    end
  end
    
  
  resources :profile_employers
  
  resources :password_resets
 
    
  resource :home, :plural => "home", :controller => "home" do
    member do
      get  "upload_pic"
      get  "eprofile"
      get  "vprofile"
      post "upload_picture"
      post "edit_picture"
    end
    get :autocomplete_profile_contact_currentcity, :on => :collection
    get :autocomplete_profile_contact_town, :on => :collection
    get :autocomplete_profile_languages, :on => :collection
    get :autocomplete_profile_relation_status, :on => :collection
    get :autocomplete_profile_religion_name, :on => :collection
    get :autocomplete_profile_employer_title, :on => :collection
    get :autocomplete_profile_employer_position, :on => :collection
    get :autocomplete_profile_employer_city, :on => :collection
    get :autocomplete_profile_employer_project, :on => :collection
    get :autocomplete_profile_employer_with, :on => :collection
    get :autocomplete_profile_university_title, :on => :collection
    get :autocomplete_profile_university_website, :on => :collection
    get :autocomplete_profile_university_concentration, :on => :collection
    get :autocomplete_profile_university_classname, :on => :collection
    get :autocomplete_profile_university_attendedfor, :on => :collection
    get :autocomplete_profile_university_with, :on => :collection
    get :autocomplete_profile_music_title, :on => :collection
    get :autocomplete_profile_book_title, :on => :collection
    get :autocomplete_profile_movie_title, :on => :collection
    get :autocomplete_profile_game_title, :on => :collection
    get :autocomplete_profile_tv, :on => :collection
    get :autocomplete_profile_play_sport_title, :on => :collection
    get :autocomplete_profile_team_sport_title, :on => :collection
    get :autocomplete_profile_player_sport_name, :on => :collection
    get :autocomplete_profile_activity_name, :on => :collection
    get :autocomplete_profile_relation_family_relation, :on => :collection
    get :autocomplete_profile_relation_family_name, :on => :collection
    get :autocomplete_profile_interest_name, :on => :collection
    get :autocomplete_profile_ppl_inspiration_title, :on => :collection
    get :autocomplete_profile_ppl_inspiration_name, :on => :collection
    post "take_picture", :on => :collection
  end
 


  resource :friends do
    member do
      post "import_hotmail"
      post "import_gmail"
      post "import_yahoo"
      post "import_file"
      post "add_request_friend"
      post "find_request_friend"
      post "remove_friend"
      get  "add_friend"
      get  "import_contact"
      post "remove_request_friend"
      get  "pending_request_friend"
      get  "all_friends"
      get "find_friend"
      get "show_friend"
      get "fetch_friends_suggestion"
      post "filter_friends_suggestion"
      get "list_friend"
    end
  end

  
  root :to => 'home#show'

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
  resources :chats do
    collection do
      get "update_chat_status"
    end
  end
  post "send_chat", :controller => "chats", :action => "send_chat"
  get "set_status", :controller => "chats", :action => "set_status"
end
