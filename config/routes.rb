Rails.application.routes.draw do
  resources :discussion_questions, :comments, :books, :genres, :users, :memberships, :bookclubs
 
end
