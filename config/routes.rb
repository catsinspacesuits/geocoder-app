Rails.application.routes.draw do
  root 'locations#search'
  resources :locations do
    collection do
	  get 'search'
	end
  end
  devise_for :users
	resources :locations do
	  collection do
		get 'find_coordinates'
	  end
	end
end
