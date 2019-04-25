Rails.application.routes.draw do
	root 'locations#find_coordinates'
	resources :locations do
		collection do
			get 'find_coordinates'
		end
	end
end
