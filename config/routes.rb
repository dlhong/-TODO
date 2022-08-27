Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'my_savings', to: 'savings#index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: %I[index new create show] do
    resources :savings
    resources :reviews, only: %i[new create destroy]
  end
end
