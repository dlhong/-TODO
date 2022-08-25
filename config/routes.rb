Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'activities#index'
  get 'my_savings', to: 'savings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: %I[index new create show] do
    resources :savings, only: %i[new create destroy edit update]
    resources :reviews, only: %i[new create destroy]
  end
end
