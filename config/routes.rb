Rails.application.routes.draw do
    get 'sessions/new'

    get 'static_pages/home'

    get 'static_pages/help'

    root 'static_pages#home'   
    get '/signup', to: 'users#new'
    get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
  
    resources :genres
    resources :subgenres
    resources :quizzs
    resources :questions
    resources :users
    get '/play/:id' ,to: 'play#show'
    post 'play/update/:id' ,to: 'play#update'
    patch 'play/update/:id', to: 'play#update'

    get '/leaderboard/genres/:id', to: 'leaderboard#index'
    get '/leaderboard/subgenres/:id', to: 'leaderboard#show'
    get '/leaderboard' , to: 'leaderboard#chose'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
