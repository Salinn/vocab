Rails.application.routes.draw do
  resources :lesson_words
  resources :sentences
  resources :word_videos
  resources :synonyms
  resources :word_forms
  resources :lesson_modules
  resources :word_roots
  resources :lessons
  resources :definitions

  resources :courses do
    resources :users do
        delete :remove_from_course
    end
  end

  resources :words
  devise_for :users, :controllers => { :registrations => 'registration' }, :path_names => { :'sign_up.html.erb' => 'register'}
  resources :users, :controller => 'users'
  post 'create_user' => 'users#create', as: :create_user
  root 'static_pages#home'
end
