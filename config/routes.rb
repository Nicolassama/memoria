Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'memos#index'
  get 'memos/about' => 'memos#about'
  get 'memos/search' => 'memos#search'
  post 'memos' => 'memos#create'

	resources :memos do
    resource :favorites, only: [:index, :create, :destroy]
    resources :comments, only: [:create]
  end

  get 'users/exit' => 'users#exit'
  delete 'users/destroy', to:'users#destroy', as: 'users_delete'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end


  get 'favorites/index' => 'favorites#index'
  post 'favorites/:id' => 'favorites#create'
  delete 'favorites/destroy', to:'favorites#destroy', as: 'favorites_delete'


  get 'notifications/index' => 'notifications#index'

  post 'contacts/:id' => 'contacts#new'
  resource :contacts, only: [:new, :create]


end
