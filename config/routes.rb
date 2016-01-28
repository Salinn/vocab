Rails.application.routes.draw do
  resources :lesson_extensions
  resources :answers
  resources :questions
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
    delete :remove_user_from_course
    delete :remove_lesson_from_course
    post :add_to_course
    post :mass_add_to_course
    post :duplicate_course
    post :share_course
    get :email_class
    get :manage_students
    get :manage_lessons
    get :syllabus
    get :description
  end

  resources :words
  devise_for :users, :controllers => { :registrations => 'registration' }
  resources :users_admin, :controller => 'users'

  post 'add_role' => 'users#add_role', as: :user_add_role
  post 'remove_role' => 'users#remove_role', as: :user_remove_role
  #post 'create_user' => 'users#create', as: :create_user
  post 'admin_create_user' => 'users#admin_create', as: :admin_create_user

  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}"
  end

  root 'static_pages#home'
end
