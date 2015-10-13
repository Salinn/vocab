Rails.application.routes.draw do
  resources :synonyms
  resources :definitions
  resources :word_forms
  resources :word_videos
  resources :words
  devise_for :users
  resources :users, :controller => 'users'
  root 'static_pages#home'
end
