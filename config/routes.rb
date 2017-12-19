Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :events, :departmentdatum
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
      post '/events/update_title', to: 'events#update_title'
		end
	end
end
