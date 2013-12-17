SocialCalendar::Application.routes.draw do
  # You can have the root of your site routed with "root"
  # devise_scope :participants do
  # root 'participants#index'
  root 'pages#home'
    #, :to => redirect('/participants/sign_in')
  # end
  
  #devise_for :participants #, :controllers => { :registrations => "registrations"}
  devise_for :organisers
  #resources :participants
  resources :organisers do
    member do
      :happening
    end

    collection do
      resources :interests, :only => [:new, :edit, :index, :create, :remove]
    end

    resources :events
  end
  # resources :events

  get "organiser/:id/similar", :to => "organisers#similar", :as => "similar"
  get "organiser/:organiser_id/interest/:id/remove", :to => "interests#remove", :as => "remove_interest"
  post "organisers/:organiser_id/happenings/:event_id/cancel", :to => "organisers#cancel", :as => "cancel_organiser_happening"
  post "organisers/:organiser_id/happenings/:event_id", :to => "organisers#join", :as => "join_organiser_happening"
  #get "participants/:id/profile", :to => "participants#profile", :as => "participant_profile"
  get "organisers/:id/profile", :to => "organisers#profile", :as => "organiser_profile"
  # patch "participants/:id/profile", :to => "participants#update"

  # devise_scope :participant do
    # get 'participant/sign_up', :to => '#registrations#new'
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
