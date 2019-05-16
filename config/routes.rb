Rails.application.routes.draw do
	get 'welcome/index'

	resources :posts

	resources :users, only: [:new, :create] do
		resources :posts
	end

	root 'welcome#index'
end
