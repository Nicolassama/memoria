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

  # ================ここをネスト(入れ子)した形に変更
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end


  get 'favorites/index' => 'favorites#index'

  get 'users/exit' => 'users#exit'
  resource :users

  get 'notifications/index' => 'notifications#index'

  resource :contacts


end
