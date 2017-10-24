Rails.application.routes.draw do
	root 'messages#index'
	
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	get 'logout', to: 'sessions#delete'
	
	get '/signup', to: 'users#new'
	resources :users, only: [:index, :show, :create]
	resources :messages
	resources :friendships
end
