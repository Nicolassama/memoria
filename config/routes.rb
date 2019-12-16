Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'memos#index'
  get 'memos/about' => 'memos#about'
  get 'memos/search' => 'memos#search'
  post 'memos' => 'memos#create'

	resources :memos do
    resource :favorites, only: [:index, :create, :destroy]
  end

  get 'users/exit' => 'users#exit'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end


  get 'favorites/index' => 'favorites#index'

  get 'notifications/index' => 'notifications#index'

  resource :contacts


end
