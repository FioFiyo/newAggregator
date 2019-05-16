Rails.application.routes.draw do
	#setup for index page
	resources :news

	root 'news#index'
end
