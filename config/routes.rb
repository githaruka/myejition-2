Rails.application.routes.draw do
  #get 'users/show'
  #get 'dictionaries/index'
  devise_for :users
  root to: "dictionaries#index"
  resources :dictionaries do
    resources :contents, only: [:new, :create, :show, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
