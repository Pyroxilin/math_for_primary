Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  resources :task_sets, only: [:show]
  resources :contents, only: [:index, :show]
  resources :exams, only: [:index, :show, :new, :edit] do
    with_options module: 'exams' do
      resources :links, only: [:index]
      resources :tasks, only: [:index]
    end
  end
  resources :exam_sessions, only: [:show, :new, :create, :destroy], module: 'exams', controller: 'sessions'

  resources :join, only: [:show]
end
