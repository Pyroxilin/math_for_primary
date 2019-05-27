Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lessons#show'
  get 'about', to: 'static_pages#about'

  resources :lessons, only: [:index, :show]
end
