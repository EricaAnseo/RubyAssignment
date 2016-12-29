Rails.application.routes.draw do
	root 'static_pages#home'
	get  '/help',    to: 'static_pages#help'
	get  '/about',   to: 'static_pages#about'
	get  '/contact', to: 'static_pages#contact'
	get  '/toc', 	 to: 'static_pages#toc'
	get  '/signup',  to: 'users#new'

	resources :users
	resources :products, only: [:create, :destroy] 

	get  '/login',	 to: 'sessions#new'
    post '/login', 	 to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get  '/addproduct',	 to: 'products#new'
    get  '/shop',	 to: 'products#shop'

end