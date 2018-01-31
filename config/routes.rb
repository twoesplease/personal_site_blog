Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :posts do
    resources :comments
  end

  root 'posts#index'

  get '/about', to: 'pages#about'
end
