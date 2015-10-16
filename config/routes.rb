Rails.application.routes.draw do
  resources :definitions
  resources :courses
  resources :words
  devise_for :users
  resources :users, :controller => 'users'
  root 'static_pages#home'
end
