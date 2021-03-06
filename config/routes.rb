Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :events
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
  resources :grades

  #All routes associated with a course
  resources :courses do
    resources :events
    resources :course_emails
    resources :grade_modifiers

    #All the routes under course/:id/lessons
    resources :lessons do
      resources :lesson_words do
        resources :lesson_word_definitions
        resources :lesson_word_sentences
        resources :lesson_word_synonyms
        resources :lesson_word_forms
        resources :lesson_word_videos
      end
      resources :lesson_extensions

      #All the routes under course/:id/lessons/:id/lesson_modules
      resources :lesson_modules do
        resources :questions do
          resources :answers
          get 'skip'
          get 'back'
        end
      end
    end

    collection { post :import }
    delete :remove_user_from_course
    delete :remove_lesson_from_course
    post :add_to_course
    post :mass_add_to_course
    post :duplicate_course
    post :share_course
    get :gradebook_course, controller: "grade_book", action: "course"
    get '/gradebook/lesson/:lesson_id' => 'grade_book#lesson', as: :gradebook_lesson
    get 'gradebook/lesson_module/:lesson_module_id' => 'grade_book#lesson_module', as: :gradebook_lesson_module
    get 'gradebook/student_grade/:student_id' => 'grade_book#student_grade', as: :gradebook_student
    get :email_class
    get :manage_students
    get :syllabus
    get :description
  end

  #All the word routes
  resources :definitions
  resources :synonyms
  resources :sentences
  resources :word_forms
  resources :word_roots do
      delete 'remove_relation' => 'word_roots#remove_relation' , as: :remove_relation
      post 'add_relation' => 'word_roots#add_relation' , as: :add_relation
  end
  resources :word_videos
  resources :words

  resources :course_emails

  devise_for :users, :controllers => { :registrations => 'registration' }, :path_names => { :'sign_up.html.erb' => 'register'}
  resources :users, :only => [:index, :show, :edit, :update, :new, :create ]
  resources :users_admin, :controller => 'users'

  post 'add_role' => 'users#add_role', as: :user_add_role
  post 'remove_role' => 'users#remove_role', as: :user_remove_role
  post 'create_user' => 'users#create', as: :create_user
  post 'admin_create_user' => 'users#admin_create', as: :admin_create_user

  #Creates static page routes
  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}"
  end

  root 'static_pages#home'
end
