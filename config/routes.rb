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
	resources :purchases, only: [:create]
	resources :products, only: [:create, :destroy] 
	resources :cart, only: [:show]

	

    get  '/',	 to: 'purchases#new'
    post '/', 	 to: 'purchases#create'

    get  '/',	 to: 'products#add_to_wishlist'
    post '/', 	 to: 'products#add_to_wishlist'

    get '/purchases' => 'purchases#new'
    post '/purchases' => 'purchases#create'

    

    
    
end