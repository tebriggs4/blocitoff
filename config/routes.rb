Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do
    resources :items, only: [:create]
  end
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end
