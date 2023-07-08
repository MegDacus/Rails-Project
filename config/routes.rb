Rails.application.routes.draw do
  resources :users, :bookclubs, :books, :genres, only: [:index, :show, :destroy, :create]

  resources :users do
    resources :memberships, only: [:show, :destroy]
  end

  resources :bookclubs do
    resources :memberships, only: [:index, :create, :destroy]
    resources :bookclub_books, only: [:index]
  end

  resources :books do
    resources :discussion_questions, only: [:index, :show, :create]
  end

  resources :discussion_questions do 
    resources :comments, only: [:index, :create, :destroy]
  end
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
