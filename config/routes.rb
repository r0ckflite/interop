Rails.application.routes.draw do
	root to: 'visitors#index'
	# latter half of next line overrides devise registrations, using mine instead
	devise_for :users, :controllers => {:registrations => "registrations"}
	resources :users, :controller => 'users'
end
