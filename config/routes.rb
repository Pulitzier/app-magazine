Rails.application.routes.draw do

	resources :dashboards, only: [:index, :show] 
	get '/show', to: 'dashboards#show'

	root to: 'dashboards#index'

	namespace :admin do

		resources :adminpanels, only: [:index, :create] 
		
		root to: 'adminpanels#index'
	end

end
