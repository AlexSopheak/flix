Rails.application.routes.draw do
	
	namespace :api, path: '/', constraints: { subdomain: 'api' } do
		resources :movies
		
	end
	resources :movies
  	resources :reviews
 
end
