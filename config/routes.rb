Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'memos#index'
  get 'memos/about' => 'memos#about'
  get 'memos/search' => 'memos#search'
  post 'memos' => 'memos#create'
  resource :memos

  get 'users/exit' => 'users#exit'
  resource :users

  get 'favorites/index' => 'favorites#index'
  resource :favorites

  get 'notifications/index' => 'notifications#index'

  resource :contacts


end
