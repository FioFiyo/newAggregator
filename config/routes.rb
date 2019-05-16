Rails.application.routes.draw do
	#setup for index page
	resources :posts

	root 'posts#index'
end
