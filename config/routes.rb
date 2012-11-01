RushApp::Application.routes.draw do

    resources :events

    resources :tags

    resources :sessions, only: [:new, :create, :destroy]

    root to: 'pages#home'

    match '/loggedout' => "pages#loggedout"

    # match '/donthackmebro' => "sessions#hack"

    get "tags/new"

    get "rush_comments/new"

    get "rushes/new"
    post 'rushes/new'
    get "cpratings/new"
    get "users/new"


    resources :users do
        member do
            get 'show'
        end
    end

    resources :rushes do
        member do
            get 'show'
            post 'edit_friend'
            post 'edit_contact'
            post 'edit'
            post 'cut'
        end
    end

    resources :rush_comments do
        member do
            get 'show'
            post 'edit'
        end
    end

    resources :cpratings do
        member do
            post 'edit'
        end
    end

    match "/auth/:provider/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout

    # API
    namespace :api do
        namespace :v1 do
            resources :rushes do
                member do
                    get 'with_info'
                end
                collection do
                    get 'search'
                end
            end
            resources :users do
                collection do
                    get 'search'
                end
            end
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

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    # root :to => 'welcome#index'

    # See how all your routes lay out with "rake routes"

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id))(.:format)'
end
