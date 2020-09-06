Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/follow_user/:id' => 'users#follow_user', as: 'follows'
  get 'user/follower_user/:id' => 'users#follower_user', as: 'followers'
end