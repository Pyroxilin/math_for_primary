Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  resources :task_sets, only: [:show]
  resources :contents, only: [:index, :show]
  resources :exams, only: [:index, :show, :new, :edit] do
    resources :links, only: [:index], module: 'exams'
  end
end
