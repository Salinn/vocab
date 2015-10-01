Rails.application.routes.draw do
  resources :words
  devise_for :users
  root 'static_pages#home'
end
