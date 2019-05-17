Rails.application.routes.draw do
	get 'welcome/index'

	resources :posts, only: [:show, :index]

	resources :users, only: [:new, :create] do
		resources :posts do 
			resources :comments, only: [:new, :create, :delete]
		end
	end

	#sessions for Users when logged in/ logged out
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	root 'welcome#index'
end
