Rails.application.routes.draw do
  resources :bookclub_books
  resources :discussion_questions, :comments, :books, :genres, :users, :memberships, :bookclubs
 
end
