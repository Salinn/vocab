Rails.application.routes.draw do
  resources :course_emails
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
    resources :lessons
    collection { post :import }
    delete :remove_from_course
    post :add_to_course
    post :mass_add_to_course
    post :duplicate_course
    post :share_course
  end

  resources :words
  devise_for :users, :controllers => { :registrations => 'registration' }, :path_names => { :'sign_up.html.erb' => 'register'}
  resources :users, :controller => 'users'
  post 'create_user' => 'users#create', as: :create_user
  root 'static_pages#home'
end
