Rails.application.routes.draw do

  devise_for :users

  resources :pictures

  resources :comments

  resources :articles do
    resources :comments
  end

  resources :users

  root to: 'articles#index'
end
