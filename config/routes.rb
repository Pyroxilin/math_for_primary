Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  namespace 'course' do
    get '', to: 'theory#index'

    resources :task_sets, only: [:show] do
      member do
        post 'submit', to: 'task_sets#submit'
      end
    end
    resources :theory, only: [:index, :show]
  end

  resources :exams do
    member do
      post 'start', to: 'exams#start', as: :start
      post 'stop', to: 'exams#stop', as: :stop
    end

    with_options module: 'exams' do
      resources :links, only: [:index]
      resources :tasks, only: [:index]
      resources :submissions, only: [:create]
    end
  end

  resources :exam_sessions, only: [:show, :new, :create, :destroy], module: 'exams', controller: 'sessions'

  resources :join, only: [:show]
end
