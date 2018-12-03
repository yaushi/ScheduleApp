Rails.application.routes.draw do

  resources :meetings
  #get '/users/new' => "users#new"
  #get '/users/create' => "users#create"
  resources :users

=begin
  get    '/users',          to: 'users#index'   # ユーザ一覧ページ
  get    '/users/:id',      to: 'users#show'    # 特定のユーザページ
  get    '/users/new',      to: 'users#new'     # ユーザ登録ページ
  post   '/users',          to: 'users#create'  # ユーザ作成
  get    '/users/:id/edit', to: 'users#edit'    # 特定のユーザ編集ページ
  patch  '/users/:id',      to: 'users#update'  # 特定のユーザ更新
  delete '/users/:id',      to: 'users#destroy' # 特定のユーザ削除  
=end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/'  => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
