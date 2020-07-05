Rails.application.routes.draw do
  get 'books/new'
  devise_for :users
  root :to =>'homes#top'
  get 'home/about', to:'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:users,only:[:index,:show,:edit,:update]
  resources:books
end
