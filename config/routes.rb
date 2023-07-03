Rails.application.routes.draw do
  resources :users, :memberships, :bookclubs, :books, :bookclub_books, :discussion_questions, :comments, :genres, only: [:index]
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
