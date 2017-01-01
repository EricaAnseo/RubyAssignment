Rails.application.routes.draw do
	root 'products#shop'
	get  '/help',    to: 'static_pages#help'
	get  '/about',   to: 'static_pages#about'
	get  '/contact', to: 'static_pages#contact'
	get  '/toc', 	 to: 'static_pages#toc'

	get  '/signup',  to: 'users#new'

    get  '/login',   to: 'sessions#new'
    post '/login',   to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
    get  '/addproduct',  to: 'products#new'

    get  '/products/:id',  to: 'products#edit'
    post  '/products/:id',  to: 'products#edit'

	resources :users
	resources :purchases
    resources :wishlists
	resources :products, only: [:create, :destroy] 
	resources :cart, only: [:show]


    resources :products do  
        member do
            put "/like", to: "products#upvote"
            put "/dislike", to: "products#downvote"
            post "/wishlist", to: "products#add_to_wishlist"
            post "/purchase", to: "products#purchase"
        end
    end  

    

    get  '/buy',	 to: 'purchases#new'
    post '/buy', 	 to: 'purchases#create'

    #get  '/',	 to: 'products#add_to_wishlist'
    #post '/', 	 to: 'products#add_to_wishlist'

    #get '/purchases' => 'purchases#new'
    #post '/purchases' => 'purchases#create'

    

    
    
end