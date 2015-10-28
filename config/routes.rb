Rails.application.routes.draw do

  resources :word_forms
  resources :sentences
  resources :word_videos
  resources :synonyms

  resources :word_roots
  resources :lessons
  resources :definitions

  resources :courses
  resources :words
  devise_for :users
  resources :users, :controller => 'users'
  root 'static_pages#home'
end
