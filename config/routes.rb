Rails.application.routes.draw do
  root 'locations#index'
  devise_for :users
	resources :locations do
		collection do
			get 'find_coordinates'
		end
	end
end
