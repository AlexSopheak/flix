Rails.application.routes.draw do
	
	namespace :api, path: '/', constraints: { subdomain: 'api' } do
		resources :movies
		
	end
	resources :movies
  	resources :reviews
  #get "movies" => "movies#index"
  #get "movies/:id" => "movies#show", as: "movie"
  #get "movies/:id" => "movies#edit", as: "edit_movie"
 	#patch "movies/:id" => "movies#update"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
